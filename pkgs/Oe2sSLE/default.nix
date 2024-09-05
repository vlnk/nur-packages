{ lib,
  stdenv,
  fetchFromGitHub,
  python3Packages,
  alsa-utils,
  portaudio
}:

stdenv.mkDerivation rec {
  version = "0.2.2";
  name = "Oe2sSLE";
  pname = "${name}-${version}";

  src = fetchFromGitHub rec {
    owner = "JonathanTaquet";
    repo = "${name}";
    rev = "v${version}";
    sha256 = "YikSSccSJfpkmcdfHic0AXCHwC+C+jOjB52SVkvtorQ=";
  };

  nativeBuildInputs = [
    alsa-utils
    portaudio
  ];

  buildInputs = with python3Packages; [
    pyaudio
    tkinter
  ];

  installPhase = ''
    mkdir -p $out
    cp -rv $src/* $out
  '';

  postInstall = ''
    substituteInPlace $out/GUI/res.py \
      --replace "images" "$out/images"
  '';

  meta = with lib; {
    description = "Open e2sSample.all Library Editor (Oe2sSLE) for Electribe Sampler.";
    license = licenses.gpl2;
    platforms = platforms.unix;
  };
}
