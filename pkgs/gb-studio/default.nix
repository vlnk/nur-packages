{ lib, stdenv, mkYarnPackage, fetchFromGitHub, nodejs }:

mkYarnPackage rec {
  owner = "chrismaltby";
  pname = "gb-studio";
  version = "3.1.0";
  name = "${pname}-${version}";

  src = fetchFromGitHub {
    inherit owner;
    repo = pname;
    rev = "v${version}";
    sha256 = "x/92I8VhcplMim9JuzVFcUD4wDwu1UEDNDuN745+nU8=";
  };


  buildPhase = ''
    yarn --offline build
  '';

  meta = with lib; {
    homepage = "https://github.com/${owner}/${pname}";
    license = licenses.mit;
    maintainers = with maintainers; [ vlnk ];
    platforms = platforms.all;
  };
}
