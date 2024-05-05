{ pkgs, ... }:

# make fish work with nix-shell
{
  home.packages = with pkgs; [
    nix-your-shell
  ];
}
