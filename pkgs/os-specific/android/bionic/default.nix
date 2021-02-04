{ lib, buildPackages, stdenv, pkgs, fetchzip, autoPatchelfHook, fetchurl }:
let 
in 
  stdenv.mkDerivation rec {
  pname = "bionic";
  version = "android-11.0.0_r31";

  src_soong = fetchzip {
    url = "https://android.googlesource.com/platform/build/soong/+archive/cca1d8a553033de13bfddba5d177086f29729d00.tar.gz";
    sha256 = "0k0whzfr17wy7ff0nanllv6fsw44jfahih7rrs3xjyai48rbf5lr";
    stripRoot = false;
  };

  src_blueprint = fetchzip {
    url = "https://android.googlesource.com/platform/build/blueprint/+archive/ea7e0bfc0d4586e2046cd328a4d2e6e694ed783c.tar.gz";
    sha256 = "19aiiz8q6gh30slm4i5p62nr62q63vhgmh6fqfj84pbp0cgls14c";
    stripRoot = false;
  };

  src_golang_protobuf = fetchzip {
    url = "https://android.googlesource.com/platform/external/golang-protobuf/+archive/e58929c83073a51fed4c23b819175c649fddfa33.tar.gz";
    sha256 = "0agbqnqhm20dazsh7xwvhj6bp3345zvfjchzwb40lc4q1l1sxgn4";
    stripRoot = false;
  };

  src_frameworks_native = fetchzip {
    url = "https://android.googlesource.com/platform/frameworks/native/+archive/e0ae724a0660121295f799061252068982e949f1.tar.gz";
    sha256 = "0nya3nmbw4chdnc7cjjgdfxrwy57n02wznaf5rjchq4ak98337q3";
    stripRoot = false;
  };

  src_art = fetchzip {
    url = "https://android.googlesource.com/platform/art/+archive/1413f21a5e2541f5d33e68a789d2aa9f00a5cb1c.tar.gz";
    sha256 = "1xmiywnh38ah9pq29ms2hs2nv4vrybki8nfzr0n8gnlc6w65rjgr";
    stripRoot = false;
  };

  src_prebuilts_ninja_linux_x86 = fetchzip {
    url = "https://android.googlesource.com/platform/prebuilts/ninja/linux-x86/+archive/6369b19fc3fbe765636af75d394627e2b92599ed.tar.gz";
    sha256 = "0fpxnf9xni2ad7yab7k625bqy971y9nk7ii9v0syapszx4cgvzd4";
    stripRoot = false;
  };

  src_prebuilts_ndk = fetchzip {
    url = "https://android.googlesource.com/platform/prebuilts/ndk/+archive/4a0fef6af484b233e411d60a4d226ad3c830941f.tar.gz";
    sha256 = "06r9jl90bvz55xzglk4ha86il210nax85szf2m52m3bmq2j1x3dn";
    stripRoot = false;
  };

  src_bionic = fetchzip {
    url = "https://android.googlesource.com/platform/bionic/+archive/b87704b227984c6b99b3cfc12a5b21ca069baeb3.tar.gz";
    sha256 = "1wfwgggy6q2ig65f3m0p0y6w63crw0ysfjwyz4292crsfkggfk44";
    stripRoot = false;
  };

  src_external_llvm = fetchzip {
    url = "https://android.googlesource.com/platform/external/llvm/+archive/948c0d1361317ffe22b5ac81131f6a041d9ef49e.tar.gz";
    sha256 = "12s2899kh2xfgndgz9xmvrl57l7lv950ag4ccfpjrk90mhrwli2g";
    stripRoot = false;
  };

  src_external_selinux = fetchzip {
    url = "https://android.googlesource.com/platform/external/selinux/+archive/0731e73364dec7a4859acbe03c6c1fa3a06bf10d.tar.gz";
    sha256 = "0cdlrk6v0xycss28v8ac3agvj9k5jrshjnk080z6cy2m1sgpdcq9";
    stripRoot = false;
  };

  src_external_pcre = fetchzip {
    url = "https://android.googlesource.com/platform/external/pcre/+archive/7fed2aa21aec621cd8c3c27261fae910b9bd8ad7.tar.gz";
    sha256 = "1mivq6p427cxca2c0ik4m8h4hdl9qrisqgbf70vi3xlb6236yg8i";
    stripRoot = false;
  };

  src_external_protobuf = fetchzip {
    url = "https://android.googlesource.com/platform/external/protobuf/+archive/2305946dc587fb5766d207c7e3981375b2aaf5ce.tar.gz";
    sha256 = "048sgqbdjflini6drvylv1miy201nakn5f7g0vb3p30vzw9d0lbj";
    stripRoot = false;
  };

  src_external_libcxx = fetchzip {
    url =
      "https://android.googlesource.com/platform/external/libcxx/+archive/a15eefdd3872e1cee0a5b490bfa9573784cbee5f.tar.gz";
    sha256 = "1fc838l6rzpwgwyf30mn0ggi7jg8w3f3krsbw2hy5pv8r6gr3x56";
    stripRoot = false;
  };

  src_external_libcxxabi = fetchzip {
    url =
      "https://android.googlesource.com/platform/external/libcxxabi/+archive/e3c7223a009074e8d6b57d56757851ede7d8ab07.tar.gz";
    sha256 = "0s7b8xd5n00wznjg31r9qb4s358w5xrbj32r8a2f0b5q49gq4pad";
    stripRoot = false;
  };

  src_external_expat = fetchzip {
    url =
      "https://android.googlesource.com/platform/external/expat/+archive/787f5e14b289bbfb73d7544a03f4ea2c64d89b6b.tar.gz";
    sha256 = "1bmh5p49sakbxqpy7b50wwvacz4648ivy8siygf50gslvns64m23";
    stripRoot = false;
  };

  src_external_googletest = fetchzip {
    url =
      "https://android.googlesource.com/platform/external/googletest/+archive/783dd00b924f4676f31ff4b5da999e8f01a090a4.tar.gz";
    sha256 = "10k6p1q0n8kgjxkcsiz9a5s6fw14q3nd278jbclrjlz826zfjahj";
    stripRoot = false;
  };

  src_external_google_benchmark = fetchzip {
    url =
      "https://android.googlesource.com/platform/external/google-benchmark/+archive/6e9b9330d4c6a1279ce715150fca8a6b7c8377c6.tar.gz";
    sha256 = "09q6snmkb5fch0w35smgz6k8yzrzs6q3aga39sfc50lfcnbxjs8h";
    stripRoot = false;
  };

  src_external_libunwind_llvm = fetchzip {
    url =
      "https://android.googlesource.com/platform/external/libunwind_llvm/+archive/b015df41c165ab31a0a63ff1319ef14dd7d52e7a.tar.gz";
    sha256 = "0zf869j0w7xjimnikmzhyifr3lin2g8vmi9z3gwhw278v078b81y";
    stripRoot = false;
  };

  src_external_lzma = fetchzip {
    url =
      "https://android.googlesource.com/platform/external/lzma/+archive/7ad0c1013f4666f8c9d088e0c6893a86057f5ebd.tar.gz";
    sha256 = "196fh3grd9dnhi2745sa0cz0bnjnzlfq6cqs94vzb3naasqaidw5";
    stripRoot = false;
  };

  src_external_lz4 = fetchzip {
    url =
      "https://android.googlesource.com/platform/external/lz4/+archive/3dd85e8c7d9a2d08035e80b1baba03c62fb83f8e.tar.gz";
    sha256 = "1f2434qcnrghky38ic172pf6y9mxrvbkfbihqmf436nl5zj3i1xh";
    stripRoot = false;
  };

  src_external_fmtlib = fetchzip {
    url =
      "https://android.googlesource.com/platform/external/fmtlib/+archive/aa6fa3aa882afe47f7af990b0c6d747a01cd6104.tar.gz";
    sha256 = "05jm2dbqcaa9dpfi79jd1vig9iqjl8ck6a326ar022wjskw8haip";
    stripRoot = false;
  };

  src_external_sqlite = fetchzip {
    url =
      "https://android.googlesource.com/platform/external/sqlite/+archive/a83f1276e86c4963019746f592bed85f5ad21fe6.tar.gz";
    sha256 = "0b9jxj97278s455j1l51gl6a04cvif1761bydp17608n66hfhznr";
    stripRoot = false;
  };

  src_external_cpython2 = fetchzip {
    url =
      "https://android.googlesource.com/platform/external/python/cpython2/+archive/4ecd9450778988240cdfa9b2721750a433cec969.tar.gz";
    sha256 = "03x0adkq6bs8v414ar5y4nxdga5ljw5my9h9vir6yrs071w1k8qs";
    stripRoot = false;
  };

  src_external_boringssl = fetchzip {
    url =
      "https://android.googlesource.com/platform/external/boringssl/+archive/b94ec526dc9909546fe74d0c2ce01cb3e0db2691.tar.gz";
    sha256 = "0lbl545qv0rkgpdkhd4q8iilj84h5gq096pb2i35dn3iphv2fysv";
    stripRoot = false;
  };
  src_external_icu = fetchzip {
    url =
      "https://android.googlesource.com/platform/external/icu/+archive/b3e4a6713d25ec768e21841c6c37100a4b1891ad.tar.gz";
    sha256 = "0xsig55aahfcflicl9kh1vrafjmpgdmxypn4pplz5b1dphglqn40";
    stripRoot = false;
  };

  src_external_zlib = fetchzip {
    url =
      "https://android.googlesource.com/platform/external/zlib/+archive/1a9b432817192342bbfb5a389058a45eea9f816c.tar.gz";
    sha256 = "12gdywfcx0042bza8b5769ifq1vv0mq5mwy1nfqlsy27jyali91c";
    stripRoot = false;
  };

  src_external_tinyxml2 = fetchzip {
    url =
      "https://android.googlesource.com/platform/external/tinyxml2/+archive/1b7e9f45b916fdafad6a450244d6d30735b075db.tar.gz";
    sha256 = "06l2zxsanbqirfnigs4v2m3a2pkyk2gy3gqa87zaqqiximk94yz9";
    stripRoot = false;
  };

  src_external_gwp_asan = fetchzip {
    url =
      "https://android.googlesource.com/platform/external/gwp_asan/+archive/76e2fecf2dd8449ab4d636dc3e55f1be1d7a56d0.tar.gz";
    sha256 = "0fn0h8hwbbv6snbid4vnq1igbk0gllq0kifpqqisdad4fi9f46bj";
    stripRoot = false;
  };

  src_external_jsoncpp = fetchzip {
    url =
      "https://android.googlesource.com/platform/external/jsoncpp/+archive/ceed690fefd71a34154781da01b3bb0294a486eb.tar.gz";
    sha256 = "1cf03pci0a303ka4ky14l6r50dpxf0xvgikdz2qflcab17i1gpxv";
    stripRoot = false;
  };

  src_external_vixl = fetchzip {
    url =
      "https://android.googlesource.com/platform/external/vixl/+archive/c150fd7455f6f3520efe35ac6b24854ecc5b3a70.tar.gz";
    sha256 = "0cr2bkar1icay1yrayxg9rh3by2bd0j8avka51k32galcilipcz0";
    stripRoot = false;
  };

  src_external_arm_optimized_routines = fetchzip {
    url =
      "https://android.googlesource.com/platform/external/arm-optimized-routines/+archive/8edcec53c6d84dc7f85e4c0a8539384b3fe489ec.tar.gz";
    sha256 = "01ynawdi7w51s9s7m1ixq0csbpn875hqmjnmrcaxcyyjhqgj3v7d";
    stripRoot = false;
  };

  src_external_libevent = fetchzip {
    url =
      "https://android.googlesource.com/platform/external/libevent/+archive/e2ad30a2c0dd53cef7fd37e5336407938b64da26.tar.gz";
    sha256 = "0rxkvqqmrj9ybz1whr7l2nrp6i1czfx6hzmmgvaavqmilqbcphaj";
    stripRoot = false;
  };

  src_external_scudo = fetchzip {
    url =
      "https://android.googlesource.com/platform/external/scudo/+archive/ac408cf4ed643f09097ca4b38bfd4141233682c3.tar.gz";
    sha256 = "1y7ach9ywgvvliyfwmn3h6r8ky1s5w0a99d40khm5fd141pm2k65";
    stripRoot = false;
  };

  src_external_jemalloc_new = fetchzip {
    url =
      "https://android.googlesource.com/platform/external/jemalloc_new/+archive/45117afe65c48295ed9b987c4e99479f04f7de62.tar.gz";
    sha256 = "0njvn2v57w09d8gc9qifrf8v25kbfnn2bm3w0s0hffq8fpb9yry2";
    stripRoot = false;
  };

  src_system_core = fetchzip {
    url =
      "https://android.googlesource.com/platform/system/core/+archive/8969a598cc42e8408d66483cbb64d94ecec57655.tar.gz";
    sha256 = "0cy6dnzab1c4d67dfy2x9v7q1p6rzjw9vrcr8zsd4zpa8cfh88x7";
    stripRoot = false;
  };

  src_system_libsysprop = fetchzip {
    url =
      "https://android.googlesource.com/platform/system/libsysprop/+archive/27c3ec696619e55dbe767728385729cdb57b518d.tar.gz";
    sha256 = "072a6pyd1nq4sv0zgvrgrq4yxd8cc1k1kv93bg8skawyqix61n6c";
    stripRoot = false;
  };

  src_system_extras_libjsonpb = fetchzip {
    url =
      "https://android.googlesource.com/platform/system/extras/+archive/refs/tags/android-11.0.0_r31/libjsonpb.tar.gz";
    sha256 = "1f2cgfa00i8iy0srs5i7ch3i8vjqykjjggb9qxfwgyhbgpbq4f6j";
    stripRoot = false;
  };

  src_system_testing_gtest_extras = fetchzip {
    url =
      "https://android.googlesource.com/platform/system/testing/gtest_extras/+archive/8e8f1e9c82c946997959642073317784627919a5.tar.gz";
    sha256 = "1ki8yz98bxjr8l5m6zayigxsa69qli780i94vc95iwl751ckrawi";
    stripRoot = false;
  };

  src_prebuilts_clang_linux_x86_androidbp = fetchurl {
    url =
    "https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+/refs/tags/android-11.0.0_r31/Android.bp?format=TEXT";
    sha256 = "175qg4xrpnfjsqcsiba671vgz57mypffdn4myi5bksj036dyw8mn";
  };
  
  src_prebuilts_clang_linux_x86_soong = fetchzip {
    url =
    "https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/refs/tags/android-11.0.0_r31/soong.tar.gz";
    sha256 = "1rx58l84v24l2y2lwfhqch89hrfdhmi332drnvzk62m0y0iyap0a";
    stripRoot = false;
  };

  src_libnativehelper = fetchzip {
    url =
      "https://android.googlesource.com/platform/libnativehelper/+archive/5c585dbe65dd45c3796ad08433a9bc64caa9df71.tar.gz";
    sha256 = "0980cfwyqw440jmvz4rj9ha2sf6nb47y4rsgz9qvazp15p8asqm7";
    stripRoot = false;
  };

  src_system_memory_libmeminfo = fetchzip {
    url =
      "https://android.googlesource.com/platform/system/memory/libmeminfo/+archive/4e98e64b980122c65c2af9dff8ff0b7b4d97eaba.tar.gz";
    sha256 = "041i3j5mz33lnki442rdlcqqgssxmw8ysgykyqv2qjka38kfzfxh";
    stripRoot = false;
  };

  src_system_memory_libion = fetchzip {
    url =
      "https://android.googlesource.com/platform/system/memory/libion/+archive/08029308f4e9b267caedb6e294971cac170b91fb.tar.gz";
    sha256 = "1h74zxprzd0gp97bj6kklrqdnx9f8nivz54ab8yspqf16xskm00a";
    stripRoot = false;
  };

  GOCACHE = "/tmp/go-cache";
  GOROOT = "${buildPackages.buildPackages.go}/share/go";

  unpackPhase = ''
    mkdir -p build/soong/
    echo ${src_soong}
    cp -r ${src_soong}/* build/soong/
    chmod -R +w build/soong
    rm -rf build/soong/python/tests
    rm -rf build/soong/java
    rm -rf build/soong/sdk
    rm -rf build/soong/apex
    rm -rf build/soong/sysprop
    rm -rf build/soong/cc/libbuildversion

    mkdir -p build/blueprint
    cp -r ${src_blueprint}/* build/blueprint/
    chmod -R +w build/blueprint
    patchShebangs --build build/blueprint/bootstrap.bash
    substituteInPlace build/blueprint/bootstrap/command.go --replace 'runGoTests:             runGoTests,' 'runGoTests:             false,'

#    mkdir -p art/
#    cp -r ${src_art}/* art/
#    chmod -R +w art/
#    rm -r art/build/sdk
#    rm -r art/build/apex
#    rm -r art/build/
#    rm -r art/oatdump
#    rm -r art/tools/ahat
#    rm -r art/tools/class2greylist
#    rm -r art/tools/jvmti-agents
#    rm -r art/tools/libjavac
#    rm -r art/tools/jfuzz
#    rm -r art/dt_fd_forward
#    rm -r art/benchmark
#    rm -r art/perfetto_hprof
#    rm -r art/adbconnection
#
#    mkdir -p libnativehelper
#    cp -r ${src_libnativehelper}/* libnativehelper/
#
    mkdir -p external/golang-protobuf
    cp -r ${src_golang_protobuf}/* external/golang-protobuf
#
#    #mkdir -p system/libsysprop
#    #cp -r ${src_system_libsysprop}/* system/libsysprop
#
#    mkdir -p system/testing/gtest_extras
#    cp -r ${src_system_testing_gtest_extras}/* system/testing/gtest_extras
#
#    mkdir -p system/memory/libmeminfo
#    cp -r ${src_system_memory_libmeminfo}/* system/memory/libmeminfo
#
#    mkdir -p system/memory/libion
#    cp -r ${src_system_memory_libion}/* system/memory/libion
#
#    mkdir -p system/extras/libjsonpb
#    cp -r ${src_system_extras_libjsonpb}/* system/extras/libjsonpb
#
#    mkdir -p system/core
#    cp -r ${src_system_core}/* system/core
#    chmod -R +w system/core
#    rm -r system/core/adb
#    rm -r system/core/healthd
#    rm -r system/core/init
#    rm -r system/core/fs_mgr
#    rm -r system/core/trusty
#    rm -r system/core/logd
#    rm -r system/core/gatekeeperd
#    rm -r system/core/fastboot
#    rm -r system/core/libstats
#    rm -r system/core/sdcard
#    rm -r system/core/run-as
#    rm -r system/core/usbd
#    rm -r system/core/libsparse
#    rm -r system/core/storaged
#    rm -r system/core/set-verity-state
#    rm -r system/core/logcat
#    rm -r system/core/qemu_pipe
#    rm -r system/core/libgrallocusage
#    rm -r system/core/bootstat
#    rm -r system/core/libsysutils
#    rm -r system/core/reboot
#    rm -r system/core/libnetutils
#    rm -r system/core/llkd
#    rm -r system/core/libsuspend
#    rm -r system/core/cpio
#    rm -r system/core/toolbox
#    rm -r system/core/libbinderwrapper
#
#
#
#    mkdir -p frameworks/native
#    #cp -r ${src_frameworks_native}/* frameworks/native
#    #chmod -R +w frameworks/native
#    #rm -r frameworks/native/libs/binderthreadstate
#    #rm -r frameworks/native/libs/binder
#    #rm -r frameworks/native/libs/gui
#    #rm -r frameworks/native/services
#    #rm -r frameworks/native/cmds
#    #rm -r frameworks/native/opengl
#    #rm -r frameworks/native/vulkan
#    #rm -r frameworks/native/libs/vr
#    #rm -r frameworks/native/libs/ui
#    #rm -r frameworks/native/libs/cputimeinstate
#    #rm -r frameworks/native/libs/sensorprivacy
#    #rm -r frameworks/native/libs/renderengine
#    #rm -r frameworks/native/libs/gralloc
#
#
#    mkdir -p external/llvm
#    cp -r ${src_external_llvm}/* external/llvm
#    chmod -R +w external/llvm
#    
#    mkdir -p external/selinux
#    cp -r ${src_external_selinux}/* external/selinux
#    chmod -R +w external/selinux
#    rm -r external/selinux/checkpolicy
#
#    mkdir -p external/pcre
#    cp -r ${src_external_pcre}/* external/pcre
#    chmod -R +w external/pcre
#
#    mkdir -p external/libunwind_llvm
#    cp -r ${src_external_libunwind_llvm}/* external/libunwind_llvm
#    
#    mkdir -p external/libevent
#    cp -r ${src_external_libevent}/* external/libevent
#    
#    mkdir -p external/scudo
#    cp -r ${src_external_scudo}/* external/scudo
#
#    mkdir -p external/jemalloc_new
#    cp -r ${src_external_jemalloc_new}/* external/jemalloc_new
#    chmod -R +w external/jemalloc_new
#    
#    mkdir -p external/arm-optimized-routines
#    cp -r ${src_external_arm_optimized_routines}/* external/arm-optimized-routines
#
#    mkdir -p external/vixl
#    cp -r ${src_external_vixl}/* external/vixl
#
    mkdir -p external/gwp_asan
    cp -r ${src_external_gwp_asan}/* external/gwp_asan
#
#    mkdir -p external/zlib
#    cp -r ${src_external_zlib}/* external/zlib
#
#    mkdir -p external/python/cpython2
#    cp -r ${src_external_cpython2}/* external/python/cpython2
#    chmod -R +w external/python/cpython2
#
#    mkdir -p external/tinyxml2
#    cp -r ${src_external_tinyxml2}/* external/tinyxml2
#    
#    mkdir -p external/jsoncpp
#    cp -r ${src_external_jsoncpp}/* external/jsoncpp
#    
#    mkdir -p external/sqlite
#    cp -r ${src_external_sqlite}/* external/sqlite
#
#    mkdir -p external/expat
#    cp -r ${src_external_expat}/* external/expat
#    chmod -R +w external/expat
#
#    mkdir -p external/icu
#    cp -r ${src_external_icu}/* external/icu
#    chmod -R +w external/icu
#    rm -r external/icu/android_icu4j
#    rm -r external/icu/icu4j
#    rm -r external/icu/tools
#    rm -r external/icu/icu4c/source/test
#
#    mkdir -p external/boringssl
#    cp -r ${src_external_boringssl}/* external/boringssl
#
#    mkdir -p external/lzma
#    cp -r ${src_external_lzma}/* external/lzma
#
#    mkdir -p external/lz4
#    cp -r ${src_external_lz4}/* external/lz4
#
#    mkdir -p external/fmtlib
#    cp -r ${src_external_fmtlib}/* external/fmtlib
#
#    mkdir -p external/protobuf
#    cp -r ${src_external_protobuf}/* external/protobuf
#
#    mkdir -p external/libcxx
#    cp -r ${src_external_libcxx}/* external/libcxx
#
#    mkdir -p external/libcxxabi
#    cp -r ${src_external_libcxxabi}/* external/libcxxabi
#
#    mkdir -p external/googletest
#    cp -r ${src_external_googletest}/* external/googletest
#
#    mkdir -p external/google-benchmark
#    cp -r ${src_external_google_benchmark}/* external/google-benchmark

    mkdir -p prebuilts/clang/host/linux-x86/soong
    cat ${src_prebuilts_clang_linux_x86_androidbp} | base64 -d > prebuilts/clang/host/linux-x86/Android.bp
    cp -r ${src_prebuilts_clang_linux_x86_soong}/* prebuilts/clang/host/linux-x86/soong/
    mkdir -p prebuilts/clang/host/linux-x86/clang-r383902b/lib64/clang/11.0.2/lib/linux
    cp ${buildPackages.buildPackages.llvmPackages_11.compiler-rt}/lib/linux/* prebuilts/clang/host/linux-x86/clang-r383902b/lib64/clang/11.0.2/lib/linux/
    cp ${pkgs.llvmPackages_11.compiler-rt}/lib/linux/* prebuilts/clang/host/linux-x86/clang-r383902b/lib64/clang/11.0.2/lib/linux/
    for f in libclang_rt.scudo_minimal-aarch64-android.a libclang_rt.hwasan_static-aarch64-android.a libclang_rt.scudo-aarch64-android.a libclang_rt.profile-aarch64-android.a libclang_rt.fuzzer-aarch64-android.a libclang_rt.builtins-x86_64-android.a libclang_rt.ubsan_minimal-x86_64-android.a libclang_rt.ubsan_minimal-aarch64-android.a libclang_rt.scudo-arm-android.a libclang_rt.ubsan_minimal-i386.a libclang_rt.scudo_minimal-arm-android.a libclang_rt.fuzzer-i386.a libclang_rt.asan-x86_64-android.so libclang_rt.ubsan_standalone-x86_64-android.so libclang_rt.profile-i386.a libclang_rt.builtins-i386.a libclang_rt.builtins-arm-android.a libclang_rt.ubsan_minimal-i686-android.a libclang_rt.asan-i386.so libclang_rt.ubsan_standalone-i386.so libclang_rt.ubsan_minimal-arm-android.a libclang_rt.profile-arm-android.a libclang_rt.ubsan_standalone-i686-android.so libclang_rt.fuzzer-arm-android.a libclang_rt.scudo-aarch64-android.so libclang_rt.asan-aarch64-android.so libclang_rt.ubsan_standalone-aarch64-android.so libclang_rt.hwasan-aarch64-android.so libclang_rt.asan-aarch64-android.map.txt libclang_rt.ubsan_standalone-arm-android.so libclang_rt.asan-arm-android.so libclang_rt.scudo-arm-android.so libclang_rt.hwasan-aarch64-android.map.txt libclang_rt.asan-arm-android.map.txt libclang_rt.scudo_minimal-aarch64-android.so libclang_rt.scudo_minimal-arm-android.so libclang_rt.scudo_minimal-arm-android.so; do 
      touch prebuilts/clang/host/linux-x86/clang-r383902b/lib64/clang/11.0.2/lib/linux/$f
    done 
    mkdir -p prebuilts/clang/host/linux-x86/clang-r383902b/bin/
    ln -s `which $CXX` prebuilts/clang/host/linux-x86/clang-r383902b/bin/clang++
    ln -s `which $CC` prebuilts/clang/host/linux-x86/clang-r383902b/bin/clang
    ln -s `which $AR` prebuilts/clang/host/linux-x86/clang-r383902b/bin/llvm-ar
    ln -s `which $LD` prebuilts/clang/host/linux-x86/clang-r383902b/bin/ld

    mkdir -p prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/lib/gcc/aarch64-linux-android/4.9.x/
    touch prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/lib/gcc/aarch64-linux-android/4.9.x/libgcc.a
    touch prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/lib/gcc/aarch64-linux-android/4.9.x/libgcov.a
    mkdir -p prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/lib/gcc/arm-linux-androideabi/4.9.x/
    touch prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/lib/gcc/arm-linux-androideabi/4.9.x/libgcc.a
    touch prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/lib/gcc/arm-linux-androideabi/4.9.x/libgcov.a
    mkdir -p prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/arm-linux-androideabi/lib/
    touch prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/arm-linux-androideabi/lib/libatomic.a
    mkdir -p prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/aarch64-linux-android/lib64/
    touch prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/aarch64-linux-android/lib64/libatomic.a
    mkdir -p prebuilts/gcc/linux-x86/host/x86_64-w64-mingw32-4.8/x86_64-w64-mingw32/lib32/
    touch prebuilts/gcc/linux-x86/host/x86_64-w64-mingw32-4.8/x86_64-w64-mingw32/lib32/libwinpthread.a
    mkdir -p prebuilts/gcc/linux-x86/host/x86_64-w64-mingw32-4.8/x86_64-w64-mingw32/lib/
    touch prebuilts/gcc/linux-x86/host/x86_64-w64-mingw32-4.8/x86_64-w64-mingw32/lib/libwinpthread.a
    mkdir -p prebuilts/clang/host/linux-x86/clang-r383902b/prebuilt_include/llvm/lib/
    touch prebuilts/clang/host/linux-x86/clang-r383902b/prebuilt_include/llvm/lib/Fuzzer
    mkdir -p prebuilts/clang/host/linux-x86/clang-r383902b/lib64/clang/11.0.2/lib/linux/aarch64/
    touch prebuilts/clang/host/linux-x86/clang-r383902b/lib64/clang/11.0.2/lib/linux/aarch64/libFuzzer.a
    touch prebuilts/clang/host/linux-x86/clang-r383902b/lib64/clang/11.0.2/lib/linux/aarch64/libomp.a
    mkdir -p prebuilts/clang/host/linux-x86/clang-r383902b/lib64/clang/11.0.2/lib/linux/arm/
    touch prebuilts/clang/host/linux-x86/clang-r383902b/lib64/clang/11.0.2/lib/linux/arm/libFuzzer.a
    touch prebuilts/clang/host/linux-x86/clang-r383902b/lib64/clang/11.0.2/lib/linux/arm/libomp.a

    mkdir -p external/compiler-rt/include

    mkdir -p prebuilts/ninja/linux-x86
    cp -r ${src_prebuilts_ninja_linux_x86}/* prebuilts/ninja/linux-x86

    mkdir -p prebuilts/ndk
    cp -r ${src_prebuilts_ndk}/* prebuilts/ndk
    chmod -R +w prebuilts/ndk/
    rm prebuilts/ndk/android_native_app_glue.bp
    touch prebuilts/ndk/android_native_app_glue.bp
    rm prebuilts/ndk/cpufeatures.bp
    touch prebuilts/ndk/cpufeatures.bp
   
    mkdir -p bionic
    cp -r ${src_bionic}/* bionic
    chmod -R +w bionic
    rm -r bionic/apex
    rm -r bionic/benchmarks
    rm -r bionic/tests
    rm -r bionic/libfdtrack
    rm -r bionic/libc/malloc_debug
    rm -r bionic/libc/malloc_hooks
    rm -r bionic/libc/bionic/scudo
    rm -r bionic/libc/system_properties
    rm -r bionic/libc/async_safe/Android.bp
    rm -r bionic/linker
    rm -r bionic/libdl
    rm -r bionic/libm
    rm bionic/libc/fs_config_generator.py
    touch bionic/libc/fs_config_generator.py
    rm bionic/libc/versioner-dependencies/common/clang-builtins
    
  '';

  dontConfigure = true;
  dontAutoPatchelf = true;

  patches = [ 
    #./protobuf_disable_java_and_python.patch 
    #./art_test_disable_tests.patch 
    #./art_libnativeloader_disable_tests.patch
    #./system_core_debuggerd_disable_tests.patch
    ./soong_disable_winpthread.patch
    ./cleanup_soong_cc_stl_go.patch
    ./bionic_nomalloc_only.patch
    #./cleanup_bionic_libc_Android.bp
    #./cleanup_bionic_linker_Android.bp
    ./cleanup_soong_Android.bp
    ./cleanup_prebuilts_clang_host_linux-x86_Android.bp
    ./cleanup_gwp_asan_Android.bp
  ];


  buildPhase = ''

    cd prebuilts/ninja/linux-x86/
    substituteInPlace ./build-ninja.sh --replace 'git clone' 'git clone -c http.sslVerify=false'
    substituteInPlace ./build-ninja.sh --replace 'commit_and_push' ""
    CC=$CC_FOR_BUILD CXX=$CXX_FOR_BUILD PLATFORM=--platform=linux bash ./build-ninja.sh
    chmod +w /tmp/ninja-/install/ninja
    #autoPatchelf ./ninja
    cd ../../
    mkdir -p build-tools/linux-x86/bin
    cp /tmp/ninja-/install/ninja build-tools/linux-x86/bin/
    export PATH=`pwd`/build-tools/linux-x86/bin:$PATH

    cd ../external/golang-protobuf
    export GOPATH="`pwd`/../../go"
    make install

    cd ../../build/blueprint
    mkdir -p ../../out/soong
    #substituteInPlace ./bootstrap.bash --replace 'if [ ! -z "$WRAPPER" ]; then' 'if [ 1 == 0 ]; then'
    export BUILDDIR=`pwd`/../../out/soong 
    bash ./bootstrap.bash
    bash $BUILDDIR/blueprint.bash $BUILDDIR/.primary/bin/gotestmain $BUILDDIR/.primary/bin/gotestrunner $BUILDDIR/.primary/bin/bpglob $BUILDDIR/.primary/bin/loadplugins $BUILDDIR/.primary/bin/minibp $BUILDDIR/bin/minibp
    pwd
    cd ../soong

    export TOP=`pwd`/../../
    #export PATH=`pwd`/../build-tools/linux-x86/bin/:$PATH
    substituteInPlace soong_ui.bash --replace "/bin/pwd" "pwd"
    substituteInPlace scripts/microfactory.bash --replace "export GOROOT" "export GOROOTXX"
    #substituteInPlace ui/build/sandbox_linux.go --replace "!c.Sandbox.Enabled" "true"
    substituteInPlace ui/build/soong.go --replace '"SOONG_SANDBOX_SOONG_BUILD", "true"' '"SOONG_SANDBOX_SOONG_BUILD", "false"'
    substituteInPlace ui/build/path.go --replace "if config.pathReplaced {" "if true {"
    touch $TOP/Android.bp
    bash soong_ui.bash --make-mode --skip-make libc_nomalloc
    cd ../../


    #echo =============================================================
    #echo bionic
    #echo =============================================================
    #cd bionic
    #build/soong/soong_ui.bash --make-mode --skip-make libc
  '';

  installPhase = ''
    mkdir $out
    cp out/soong/host/linux-x86/bin/* $out/
  '';

  BUILD_USER="nix";
  BUILD_HOST="nix";

  nativeBuildInputs = [ 
    autoPatchelfHook 
    buildPackages.buildPackages.git  
    buildPackages.buildPackages.go 
    buildPackages.buildPackages.python 
    buildPackages.buildPackages.which
  ];
  depsBuildBuild = [ buildPackages.buildPackages.llvmPackages_11.stdenv.cc ];

  meta = with lib; {
    description = "Google Soong Build System, written in Go";
    homepage = "https://android.googlesource.com/platform/build/soong/";
    license = licenses.asl20;
    maintainers = with maintainers; [ s1341 ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}
