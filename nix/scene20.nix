{
  lib,
  stdenv,
  fetchFromGitHub,
  meson,
  ninja,
  wlroots_0_20,
  scdoc,
  pkg-config,
  wayland,
  libdrm,
  libxkbcommon,
  pixman,
  wayland-protocols,
  wayland-scanner,
  libGL,
  libgbm,
  libxcb,
  libxcb-wm,
  validatePkgConfig,
  lcms2
}:

stdenv.mkDerivation {
  pname = "scenefx";
  version = "0.5.0";

  src = fetchFromGitHub {
    owner = "wlrfx";
    repo = "scenefx";
    rev = "main";
    hash = "sha256-Pl1R6K4N7A8OE//tor+kYIpSJV6aSgiIyacxLX2hE1A=";
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    scdoc
    validatePkgConfig
    lcms2
  ];

  buildInputs = [
    libdrm
    libGL
    libxkbcommon
    libgbm
    libxcb
    libxcb-wm
    pixman
    wayland
    wayland-protocols
    wayland-scanner
    wlroots_0_20
    lcms2
  ];

  mesonFlags = [
    "-Ddefault_library=shared"
  ];

  strictDeps = true;

  meta = with lib; {
    description = "Drop-in replacement for the wlroots scene API with visual effects";
    homepage = "https://github.com/wlrfx/scenefx";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
