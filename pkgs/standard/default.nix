{ lib, stdenv, mkYarnPackage, fetchFromGitHub, }:

let
  pname = "standard";
  version = "16.0.4";
in mkYarnPackage {
  name = "${pname}-${version}";

  src =
    fetchFromGitHub {
      owner = pname;
      repo = pname;
      rev = "f3e27f6b42d4e4745315d8026cd2017780a4565b";
      hash = "sha256-9klRyrnpdL0RJ8FupICbViG/oa3IFwqDcA6xoP9CvIs=";
    };

  buildPhase = "yarn build";

  installPhase = ''
    install -dm755 $out
    cp -r deps/${pname}/build/* $out
  '';

  distPhase = "true";

  meta = with lib; {
    homepage = "https://github.com/${pname}/${pname}";
    license = licenses.mit;
    maintainers = [ maintainers.vlnk ];
    platforms = platforms.all;
    broken = true;
  };
}
