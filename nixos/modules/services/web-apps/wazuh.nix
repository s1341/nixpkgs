{ config, lib, pkgs, ... }:

let
  cfg = config.services.wazuh;
in
{
  options.services.wazuh = {
    enable = lib.mkEnableOption (lib.mdDoc "wazuh");

    networkSubnet = lib.mkOption {
      default = "172.20.0.0/16";
      type = lib.types.str;
      description = lib.mdDoc ''
        The network subnet to use for the containers.
      '';
    };

    postgres = {
      user = lib.mkOption {
        default = "wazuh";
        type = lib.types.str;
        description = lib.mdDoc ''
          Username to use for the postgres database.
        '';
      };
      password = lib.mkOption {
        default = "wazuh";
        type = lib.types.str;
        description = lib.mdDoc ''
          password to use for the postgres database.
        '';
      };
    };

    redisPassword = lib.mkOption {
      default = "wazuh";
      type = lib.types.str;
      description = lib.mdDoc ''
        password to use for the redis cache.
      '';
    };

    defaultAdminPassword = lib.mkOption {
      default = "wazuh";
      type = lib.types.str;
      description = lib.mdDoc ''
        default admin password to use.
      '';
    };

    defaultUserPassword = lib.mkOption {
      default = "wazuh";
      type = lib.types.str;
      description = lib.mdDoc ''
        default user password to use.
      '';
    };

    defaultManagerToken = lib.mkOption {
      default = "wazuh";
      type = lib.types.str;
      description = lib.mdDoc ''
        default manager token to use.
      '';
    };

    defaultGuacToken = lib.mkOption {
      default = "wazuh";
      type = lib.types.str;
      description = lib.mdDoc ''
        default guac token to use.
      '';
    };

    defaultRegistrationToken = lib.mkOption {
      default = "wazuh";
      type = lib.types.str;
      description = lib.mdDoc ''
        default registration token to use.
      '';
    };

    datastorePath = lib.mkOption {
      type = lib.types.str;
      default = "/var/lib/wazuh";
      description = lib.mdDoc ''
        The directory used to store all data for wazuh.
      '';
    };

    listenAddress = lib.mkOption {
      type = lib.types.str;
      default = "0.0.0.0";
      description = lib.mdDoc ''
        The address on which wazuh should listen.
      '';
    };

    listenPort = lib.mkOption {
      type = lib.types.int;
      default = 443;
      description = lib.mdDoc ''
        The port on which wazuh should listen.
      '';
    };

    sslCertificate = lib.mkOption {
      type = lib.types.nullOr lib.types.path;
      default = null;
      description = lib.mdDoc ''
        The SSL certificate to be used for wazuh.
      '';
    };

    sslCertificateKey = lib.mkOption {
      type = lib.types.nullOr lib.types.path;
      default = null;
      description = lib.mdDoc ''
        The SSL certificate's key to be used for wazuh. Make sure to specify
        this as a string and not a literal path, so that it is not accidentally
        included in your nixstore.
      '';
    };
  };

  config = lib.mkIf cfg.enable {

    system.activationScripts."wazuh-setup" = ''
      rm -rf /var/ossec/
      mkdir -p /var/ossec/var/run
      chown -R wazuh:wazuh /var/ossec/
      for f in ${pkgs.wazuh}/*; do 
        cp -r $f /var/ossec/
      done
      mkdir -p /var/ossec/logs 
      ln -s /var/ossec/logs /var/ossec/bin/logs
      ln -s /var/ossec/etc /var/ossec/bin/etc
      ln -s /var/ossec/api /var/ossec/bin/api
      ln -s /var/ossec/var /var/ossec/bin/var

    '';

    users = {
      users."wazuh" = {
        isSystemUser = true;
        group = "wazuh";
      };
      groups."wazuh" = {};
    };

    systemd.services = {
      "wazuh-manager" = {
        wantedBy = [ "multi-user.target" ];
        wants = [
          "network-online.target"
        ];
        after = [
          "network.target"
          "network-online.target"
        ];
        serviceConfig = {
          Type = "forking";
          LimitNOFILE = 65536;

          Environement="WAZUH_PATH=/var/ossec";
          WorkingDirectory="/var/ossec/";
          ExecStart = "/var/ossec/bin/wazuh-control start";
          ExecStop = "/var/ossec/bin/wazuh-control stop";
          ExecReload = "/var/ossec/bin/wazuh-control reload";

          KillMode ="process";
          RemainAfterExit = "yes";
        };
      };
    };
  };
}
