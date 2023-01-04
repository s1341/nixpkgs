{ lib
, pkgs
, aiohttp
, aioredis
, envparse
, buildPythonPackage
, fetchFromGitHub
, pytest-aiohttp
, pytest-asyncio
, pythonOlder
}:

buildPythonPackage rec {
  pname = "aiohttp-cache";
  version = "1.0.1";
  format = "pyproject";

  disabled = pythonOlder "3.6";

  src = fetchFromGitHub {
    owner = "cr0hn";
    repo = pname;
    rev = "5560d2f7285c1757c4f5950408d60eecb6e56dff";
    hash = "sha256-bcBcMsFHzmo8iHCiiQFgvsnkesR4BsiDN9ST0rGqX8c=";
  };

  nativeBuildInputs = [
    pkgs.poetry
  ];

  propagatedBuildInputs = [
    aiohttp
    envparse
    aioredis
  ];

  checkInputs = [
    pytest-aiohttp
    pytest-asyncio
  ];

  pythonImportsCheck = [
    "aiohttp_cache"
  ];

  meta = with lib; {
    description = "A cache system for aiohttp server";
    homepage = "https://github.com/cr0hn/aiohttp-cache/";
    license = licenses.bsd0;
    maintainers = with maintainers; [ s1341 ];
  };
}
