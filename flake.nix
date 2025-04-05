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
      rtmaps-unpacked = builtins.fetchTarball {
        url = "https://dl.intempora.com/RTMaps4/rtmaps_4.13.0_ubuntu2404_x86_64_release.tar.bz2";
        sha256 = "sha256:1dbfdfiqrpcbp7zjgmbsv627hbc54mq899zv63x196sgnjma0zyd";
      };
    };
  };
}
