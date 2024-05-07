{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    firefox
    megasync # this needs unfree setting to be set
    # specific to gnome
    gnome3.gnome-tweaks
    gnomeExtensions.pop-shell
    gnomeExtensions.just-perfection
  ];
}
