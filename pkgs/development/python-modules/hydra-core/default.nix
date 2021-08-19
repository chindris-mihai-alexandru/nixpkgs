{ lib
, buildPythonPackage
, fetchPypi
, fetchFromGitHub
, antlr4-python3-runtime
, importlib-resources
, jdk
, omegaconf
}:

buildPythonPackage rec {
  name = "hydra-core";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "facebookresearch";
    repo = "hydra";
    rev = "v${version}";
    sha256 = "1hz95k7wc5ys704284syc70814yi3gdff494yn9zf77hzz7j16vy";
  };

  nativeBuildInputs = [
    jdk
    antlr4-python3-runtime
  ];

  propagatedBuildInputs = [
    importlib-resources
    omegaconf
  ];

  doCheck = false;

  meta = with lib; {
    description = "A framework for elegantly configuring complex applications";
    homepage = "https://github.com/facebookresearch/hydra";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
