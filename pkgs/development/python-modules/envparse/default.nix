{ lib
, aiohttp
, aioredis
, envparse
, buildPythonPackage
, callPackage
, fetchFromGitHub
, pytest-aiohttp
, pytestCheckHook
, pythonOlder
, webargs
}:

buildPythonPackage rec {
  pname = "envparse";
  version = "0.2.0";
  format = "setuptools";

  disabled = pythonOlder "3.6";

  src = fetchFromGitHub {
    owner = "rconradharris";
    repo = pname;
    rev = "e67e70307af19d925e194b2a163e0608dae7eb55";
    hash = "sha256-zl1BGQXeK5hn9kSFGZy5tW8MA8Oy7dq6pZOm0Rp6mvc=";
  };

  checkInputs = [
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "envparse"
  ];

  meta = with lib; {
    description = "Environment Variable Parsing for Python";
    homepage = "https://github.com/cr0hn/aiohttp-cache/";
    license = licenses.mit;
    maintainers = with maintainers; [ s1341 ];
  };
}
