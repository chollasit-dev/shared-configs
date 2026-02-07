{
  description = "My global non-NixOS machine flake at home";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = {nixpkgs, ...}: let
    arch = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${arch};
    tools = with pkgs; [
      cloc
      csvlens
      dig
      glow
      litecli
      pgcli
      posting
      tig
      xleak
    ];
  in {
    packages.${arch} = rec {
      flake_at_home = pkgs.buildEnv {
        name = "flake-at-home";
        paths = tools;
      };
      default = flake_at_home;
    };
  };
}
