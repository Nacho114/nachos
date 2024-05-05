{ pkgs, ... }:

{
  home.packages = with pkgs; [
    autotiling
    wofi
    pulseaudio
    pavucontrol
    swaylock
  ];
}
