{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    packages.${system} = rec {
      rtmaps = pkgs.buildFHSEnv {
        name = "rtmaps";
        version = "4.13.0";

        targetPkgs = pkgs: [
          pkgs.xorg.libX11
          pkgs.libz
          pkgs.libxml2
          pkgs.curl
          pkgs.stdenv.cc.cc.lib

          pkgs.glib
          pkgs.gdk-pixbuf
          pkgs.gtk2-x11

          pkgs.xorg.libXtst

          pkgs.xorg.libxcb
          pkgs.xorg.xcbutilkeysyms

          pkgs.libGL
          pkgs.libxkbcommon
          pkgs.pcre2
          pkgs.zstd
        ];

        extraBuildCommands = ''
          mkdir -p $out/opt
          ln -s "${rtmaps-unpacked}/opt/rtmaps/" "$out/opt/rtmaps"
          ln -s "${rtmaps-unpacked}/usr/bin/rtmaps" "$out/usr/bin/rtmaps"
          ln -s "${rtmaps-unpacked}/usr/bin/rtmaps_license_tools" "$out/usr/bin/rtmaps_license_tools"
          ln -s "${rtmaps-unpacked}/usr/bin/rtmaps_runtime" "$out/usr/bin/rtmaps_runtime"
          ln -s "${rtmaps-unpacked}/usr/bin/rtmaps_sdk_wizard" "$out/usr/bin/rtmaps_sdk_wizard"
          ln -s "${rtmaps-unpacked}/usr/bin/rtmaps_updater" "$out/usr/bin/rtmaps_updater"
        '';
        runScript = ''rtmaps'';
      };

      rtmaps-unpacked = builtins.fetchTarball {
        url = "https://dl.intempora.com/RTMaps4/rtmaps_4.13.0_ubuntu2404_x86_64_release.tar.bz2";
        sha256 = "sha256:1dbfdfiqrpcbp7zjgmbsv627hbc54mq899zv63x196sgnjma0zyd";
      };
    };
  };
}
