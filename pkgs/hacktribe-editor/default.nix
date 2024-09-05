{ lib
, stdenv
, fetchFromGitHub
, boost182
, cmake
, qt6
, wrapQtAppsHook ? qt6.wrapQtAppsHook
, ffmpeg
, pkg-config
}:

buildPythonPackage rec {
  owner = "bangcorrupt";
  name = "hacktribe-editor";
  version = "7c592e79f28fff214b477a1a74951c03494a731a";

  src = fetchFromGitHub rec {
    inherit owner;
    repo = "${name}";
    rev = "${version}";
    sha256 = "ULFNFbIFaz4Oo7RWoBRm606dGGsv+bhWMFewsB8cATA=";
    fetchSubmodules = true;
  };

  propagatedBuildInputs = [
    PyQt5
    bsdiff4
    construct
  ];

  meta = with lib; {
    description = "ossia score, an interactive sequencer for the intermedia arts";
    license = licenses.gpl3;
    maintainers = with maintainers; [ vlnk ];
    platforms = platforms.unix;
  };
}
