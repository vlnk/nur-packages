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

stdenv.mkDerivation rec {
  owner = "ossia";
  name = "score";
  pname = "${owner}-${name}";
  version = "3.1.11";

  src = fetchFromGitHub rec {
    inherit owner;
    repo = "${name}";
    rev = "v${version}";
    sha256 = "ULFNFbIFaz4Oo7RWoBRm606dGGsv+bhWMFewsB8cATA=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    cmake
    pkg-config
    wrapQtAppsHook
    boost182
  ];

  buildInputs = [
    qt6.qtbase
    qt6.qtimageformats
    qt6.qtsvg
    qt6.qtwebsockets
    qt6.qtserialport
    qt6.qtdeclarative
    qt6.qtscxml
    qt6.qtshadertools
    ffmpeg
  ];

  cmakeFlags = [
    "-Wno-error=unused-result"
    "-DCMAKE_BUILD_TYPE=Release"
    "-DCMAKE_UNITY_BUILD=1"
    "-DDEPLOYMENT_BUILD=1"
    "-DCMAKE_SKIP_RPATH=ON"
  ];

  meta = with lib; {
    description = "ossia score, an interactive sequencer for the intermedia arts";
    license = licenses.gpl3;
    maintainers = with maintainers; [ vlnk ];
    platforms = platforms.unix;
  };
}
