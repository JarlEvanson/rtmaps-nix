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

        targetPkgs = pkgs: [
          /*
          Additional dependencies

          dbus-x11
          gstreamer1.0-alsa
          gstreamer1.0-gl
          gstreamer1.0-gtk3
          gstreamer1.0-libav
          gstreamer1.0-plugins-bad
          gstreamer1.0-plugins-base
          gstreamer1.0-plugins-good
          gstreamer1.0-plugins-ugly
          gstreamer1.0-pulseaudio
          gstreamer1.0-qt5
          gstreamer1.0-tools
          gstreamer1.0-x
          libasound2 (>= 1.0.16)
          libc6 (>= 2.29)
          libcap2-bin
          libcurl4 (>= 7.16.2)
          libdc1394-25 (>= 2.2.6)
          libevent-2.1-7
          libfontconfig1 (>= 2.12.6)
          libgcc-s1 (>= 3.4)
          libgl1
          libgomp1 (>= 4.4)
          libgstreamer1.0-0
          libgstrtspserver-1.0-0
          libgtk2.0-0
          libice6 (>= 1:1.0.0)
          libopengl0
          libpcre2-16-0
          libraw1394-11
          libsm6
          libssl3 (>= 3.0.2)
          libstdc++6 (>= 9)
          libusb-1.0-0 (>= 2:1.0.9)
          libx11-6
          libx11-xcb1 (>= 2:1.6.9)
          libxcb-cursor0
          libxcb-icccm4
          libxcb-keysyms1 (>= 0.4.0)
          libxcb-xinerama0
          libxcb-xkb1
          libxerces-c3.2
          libxext6
          libxkbcommon-x11-0
          libxml2 (>= 2.7.4)
          libxrender1
          */
          
          /*
          #dbus-x11
          pkgs.dbus
          #gstreamer1.0-alsa
          #gstreamer1.0-gl
          #gstreamer1.0-gtk3
          #gstreamer1.0-libav
          pkgs.gst_all_1.gst-libav
          #gstreamer1.0-plugins-bad
          pkgs.gst_all_1.gst-plugins-bad
          #gstreamer1.0-plugins-base
          pkgs.gst_all_1.gst-plugins-base
          #gstreamer1.0-plugins-good
          pkgs.gst_all_1.gst-plugins-good
          #gstreamer1.0-plugins-ugly
          pkgs.gst_all_1.gst-plugins-ugly
          #gstreamer1.0-pulseaudio
          #gstreamer1.0-qt5
          #gstreamer1.0-tools
          #gstreamer1.0-x
          #libasound2 (>= 1.0.16)
          pkgs.alsa-oss
          #libc6 (>= 2.29)
          pkgs.glibc
          #libcap2-bin
          pkgs.libcap
          #libcurl4 (>= 7.16.2)
          pkgs.curlFull
          #libdc1394-25 (>= 2.2.6)
          pkgs.libdc1394
          #libevent-2.1-7
          pkgs.libevent
          #libfontconfig1 (>= 2.12.6)
          pkgs.fontconfig
          #libgcc-s1 (>= 3.4)
          pkgs.libgcc
          #libgl1
          #libgomp1 (>= 4.4)
          pkgs.gomp
          #libgstreamer1.0-0
          pkgs.gst_all_1.gstreamer
          pkgs.gst_all_1.gst-vaapi
          #libgstrtspserver-1.0-0
          pkgs.gst_all_1.gst-rtsp-server
          #libgtk2.0-0
          pkgs.gtk2
          #libice6 (>= 1:1.0.0)
          pkgs.xorg.libICE
          #libopengl0
          pkgs.libGL
          #libpcre2-16-0
          pkgs.pcre2
          #libraw1394-11
          pkgs.libraw1394
          #libsm6
          pkgs.xorg.libSM
          #libssl3 (>= 3.0.2)
          pkgs.openssl
          #libstdc++6 (>= 9)
          pkgs.stdenv.cc.cc.lib
          #libusb-1.0-0 (>= 2:1.0.9)
          pkgs.libusb1
          #libx11-6
          pkgs.xorg.libX11
          #libx11-xcb1 (>= 2:1.6.9)
          #libxcb-cursor0
          #libxcb-icccm4
          #libxcb-keysyms1 (>= 0.4.0)
          pkgs.xorg.xcbutilkeysyms
          #libxcb-xinerama0
          pkgs.xorg.libXinerama
          #libxcb-xkb1
          pkgs.xorg.libxcb
          #libxerces-c3.2
          pkgs.xercesc
          #libxext6
          pkgs.xorg.libXext
          #libxkbcommon-x11-0
          pkgs.libxkbcommon
          #libxml2 (>= 2.7.4)
          pkgs.libxml2
          #libxrender1
          pkgs.xorg.libXrender


          pkgs.freetype
          pkgs.zstd
          pkgs.libpng
          pkgs.brotli
          */

          /*
          pkgs.libxml2
          pkgs.xorg.libX11
          pkgs.xorg.libXext

          pkgs.libGL
          pkgs.fontconfig
          pkgs.libpng

          pkgs.libxkbcommon
          pkgs.freetype
          pkgs.xorg.xcbutilkeysyms
          pkgs.pcre2
          pkgs.zstd
          pkgs.brotli
          pkgs.dbus

          pkgs.xorg.libxcb
          */

          pkgs.glib
          pkgs.gtk2
          pkgs.gtk2-x11

          pkgs.xorg.libXtst
          
          pkgs.libxml2
          
          pkgs.libGL
          pkgs.xorg.libX11
          pkgs.xorg.xcbutilkeysyms
          pkgs.xorg.libxcb

          pkgs.libxkbcommon
          pkgs.pcre2
          pkgs.zstd
          pkgs.dbus
          pkgs.xorg.libXrender

          pkgs.ltrace
          pkgs.strace
        ];

        extraBuildCommands = ''
          cp -r ${rtmaps-unpacked}/* $out
        '';
        runScript = ''strace -f --string-limit 1000 env LD_PRELOAD="/home/jarl/projects/personal/hook/target/release/libhook.so" /opt/rtmaps/bin/rtmaps'';
      };

      rtmaps_runtime = pkgs.buildFHSEnv {
        name = "rtmaps_runtime";

        targetPkgs = pkgs: [
          pkgs.libxml2
          pkgs.xorg.libX11
          pkgs.xorg.libXext

          pkgs.libGL
          pkgs.fontconfig
          pkgs.libpng

          pkgs.libxkbcommon
          pkgs.freetype
          pkgs.xorg.xcbutilkeysyms
          pkgs.pcre2
          pkgs.zstd
          pkgs.brotli
          pkgs.dbus
          pkgs.xorg.libxcb

          pkgs.qt5.full
          
          pkgs.egl-wayland
          pkgs.mesa
        ];

        extraBuildCommands = ''
          cp -r ${rtmaps-unpacked}/* $out
        '';
        runScript = ''env LD_PRELOAD="/home/jarl/projects/personal/hook/target/release/libhook.so" /opt/rtmaps/bin/rtmaps_runtime'';
      };

      rtmaps-unpacked = builtins.fetchTarball {
        url = "https://dl.intempora.com/RTMaps4/rtmaps_4.13.0_ubuntu2404_x86_64_release.tar.bz2";
        sha256 = "sha256:1dbfdfiqrpcbp7zjgmbsv627hbc54mq899zv63x196sgnjma0zyd";
      };
    };
  };
}
