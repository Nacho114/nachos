{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    firefox
    megasync
    # specific to gnome
    gnome3.gnome-tweaks
    gnomeExtensions.pop-shell
  ];
}
