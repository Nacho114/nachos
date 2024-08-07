{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    firefox
    calibre
    brave
    megasync # this needs unfree setting to be set
    transmission-gtk #torrent client
    # pdf
    zathura
    pdfarranger
    xournalpp
    # specific to gnome
    gnome3.gnome-tweaks
    gnomeExtensions.pop-shell
    gnomeExtensions.just-perfection
  ];
}
