{ pkgs, ... }:
# Tools for sway or other window managers
{
  home.packages = with pkgs; [
    autotiling
    wofi
    pulseaudio
    pavucontrol
    swaylock
  ];
}
