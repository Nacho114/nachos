{ pkgs, ... }:

{
  users.users.nacho.packages = with pkgs; [
    firefox
    megasync
    # specific to gnome
    gnome3.gnome-tweaks
    gnomeExtensions.pop-shell
  ];
}
