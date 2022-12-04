{ lib, stdenv, mkYarnPackage, fetchFromGitHub, nodejs }:

stdenv.mkDerivation rec {
  pname = "standard";
  version = "16.0.4";
  name = "${pname}-${version}";

  src = fetchFromGitHub {
    owner = pname;
    repo = pname;
    rev = "f3e27f6b42d4e4745315d8026cd2017780a4565b";
    sha256 = "RBEfIPr6HmPlsIb8dJYjClINRmWrn+AOedFiUxwP1xk=";
  };

  nativeBuildInputs = [ nodejs ];

  configurePhase = "npm install";

  installPhase = ''
    mv ~/{bin,lib,node_modules,package.json,package-lock.json} $out/
  '';

  meta = with lib; {
    homepage = "https://github.com/${pname}/${pname}";
    license = licenses.mit;
    maintainers = with maintainers; [ vlnk ];
    platforms = platforms.all;
  };
}
