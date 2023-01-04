{ stdenv
, lib
, pkgs
, fetchFromGitHub
, ensureNewerSourcesForZipFilesHook
, makeWrapper

, meson
, ninja
, pkg-config
, gnumake

, gawk
, cjson
, zlib
, sqlite
, openssl
, libyaml
, curl
, audit
, libffi
, libplist
, python3
, msgpack
, bzip2
#, googletest
, pcre2
, procps
, db
, pacman
, libarchive
, rpm
, popt
, jemalloc

, userLanguage ? "en"
}:

let 
  python = (python3.withPackages (ps: with ps; [
    aiohttp
    aiohttp-cache
    cachetools
    connexion
    cryptography
    defusedxml
    python-json-logger
    jsonschema
    psutil
    pyyaml
    secure
    setuptools
    sqlalchemy
    uvloop
  ]));
in
stdenv.mkDerivation rec {
  pname = "wazuh";
  version = "4.3.10";

  #src = fetchzip {
    #url = "https://github.com/wazuh/wazuh/archive/v${version}.tar.gz";
    #hash = "sha256-uiOnJcjoNPT+eWDSRI+zFO+5yc9/1v5zaPqij32i+lU=";

  #};
  src = fetchFromGitHub {
    owner = "s1341";
    repo = pname;
    rev = "meson_build";
    hash = "sha256-HM21u5AZP8Q31Y2+PzAzd4NqDr/Ya/NAcgg3ZXScPWw=";
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    gnumake
    python
    ensureNewerSourcesForZipFilesHook
    makeWrapper
  ];


  buildInputs = [
    gawk
    cjson
    zlib
    sqlite
    openssl
    libyaml
    curl
    audit
    libffi
    libplist
    python
    msgpack
    bzip2
    pcre2
    procps
    db
    pacman
    libarchive
    rpm
    popt
    jemalloc
  ];

  preConfigure = ''
    cd src
  '';


  postInstall = ''
    cd ../../

    mkdir -p $out/etc
    ln -s /etc/localtime $out/etc/
    ln -s /etc/TIMEZONE $out/etc/

    cp etc/internal_options.conf $out/etc/
    cp etc/local_internal_options.conf $out/etc/
    touch $out/etc/client.keys

    cp etc/ossec-server.conf $out/etc/ossec.conf

    mkdir -p $out/agentless
    cp src/agentlessd/scripts/* $out/agentless

    mkdir -p $out/active-response/bin
    cp src/active-response/*.sh $out/active-response/bin
    cp src/active-response/*.py $out/active-response/bin
    for f in default-firewall-drop pf npf ipfw firewalld-drop disable-account \
      host-deny ip-customblock restart-wazuh route-null kaspersky wazuh-slack; do 
      mv $out/bin/$f $out/active-response/bin
    done


    mkdir -p $out/ruleset/rules $out/ruleset/decoders $out/etc/rootcheck
    cp ruleset/rules/*.xml $out/ruleset/rules/
    cp ruleset/decoders/*.xml $out/ruleset/decoders/
    cp ruleset/rootcheck/db/*.txt $out/etc/rootcheck/

    #TODO: install sca

    mkdir -p $out/etc/decoders $out/etc/rules
    cp etc/local_decoder.xml $out/etc/decoders/
    cp etc/local_rules.xml $out/etc/rules/

    mkdir -p $out/etc/lists/amazon
    cp ruleset/lists/amazon/* $out/etc/lists/amazon

    cp ruleset/lists/audit-keys $out/etc/lists/
    cp ruleset/lists/security-eventchannel $out/etc/lists/

    mkdir -p $out/integrations
    cp integrations/pagerduty $out/integrations/
    cp integrations/slack $out/integrations/
    cp integrations/virustotal $out/integrations/
    cp integrations/shuffle.py $out/integrations/

    mkdir -p $out/queue/vulnerabilities/dictionaries
    cp src/wazuh_modules/vulnerability_detector/cpe_helper.json $out/queue/vulnerabilities/dictionaries

    pushd framework
    ${python.interpreter} setup.py clean --all install \
      --wazuh-version=${version} --install-type=server --prefix=$out
    popd
    pushd api
    ${python.interpreter} setup.py clean --all install --prefix=$out
    popd


    # install api
    mkdir -p $out/api/configuration/{ssl,security}
    cp api/api/configuration/api.yaml $out/api/configuration
    mkdir -p $out/api/scripts/
    cp api/scripts/wazuh-apid.py $out/api/scripts/

    python_path=${python.out}/${python.sitePackages}
    for f in $out/${python.sitePackages}/*.egg; do
      python_path=$python_path:$f
    done
    echo $python_path

    mkdir -p $out/framework/python/bin
    ln -s ${python.interpreter} $out/framework/python/bin/python3
    wrapProgram $out/framework/python/bin/python3 \
      --prefix PYTHONPATH : $python_path


    chmod +x api/wrappers/generic_wrapper.sh
    cp api/wrappers/generic_wrapper.sh $out/bin/wazuh-apid

    mkdir -p $out/etc/shared/default/
    cp ruleset/rootcheck/db/*.txt $out/etc/shared/default/
    cp etc/agent.conf $out/etc/shared/default/
    cp etc/agent.conf $out/etc/shared/agent-template.conf

    cp -r wodles $out/
    mv $out/wodles/docker-listener $out/wodles/docker

    pushd framework/scripts/
    mkdir -p $out/framework
    for f in *.py; do
      cp $f $out/framework/$f
      chmod +x $out/framework/$f
      makeWrapper $out/framework/$f $out/bin/''${f%.py} \
        --prefix PYTHONPATH : $python_path
    done
    popd
    rm $out/framework/__init__.py
    rm $out/bin/__init__

    mv $out/bin/wazuh{_,-}logtest
    mv $out/bin/wazuh{_,-}clusterd

    chmod +x framework/wrappers/generic_wrapper.sh
    cp framework/wrappers/generic_wrapper.sh $out/wodles/aws/aws-s3
    cp framework/wrappers/generic_wrapper.sh $out/wodles/gcloud/gcloud
    cp framework/wrappers/generic_wrapper.sh $out/wodles/docker/DockerListener
    cp framework/wrappers/generic_wrapper.sh $out/wodles/azure/orm.py
    chmod +x $out/wodles/azure/orm.py

    # GenerateAuthCert
    echo "Generating self-signed certificate for wazuh-authd..."
    $out/bin/wazuh-authd -C 365 -B 2048 -K $out/etc/sslmanager.key -X $out/etc/sslmanager.cert -S "/C=US/ST=California/CN=wazuh/"

    cp framework/wrappers/generic_wrapper.sh $out/integrations/slack
    cp framework/wrappers/generic_wrapper.sh $out/integrations/virustotal
    cp framework/wrappers/generic_wrapper.sh $out/integrations/shufle

    cp src/init/wazuh-server.sh $out/bin/wazuh-control
    chmod +x $out/bin/wazuh-control
    substituteInPlace $out/bin/wazuh-control --replace awk ${gawk}/bin/awk
  '';

  meta = with lib; {
    homepage = "https://www.wazuh.com/";
    description = "Unified XDR and SIEM protetion for endpoints and cloud worksloads.";
    license = licenses.gpl2;
    maintainers = with maintainers; [ s1341 ];
  };
}
