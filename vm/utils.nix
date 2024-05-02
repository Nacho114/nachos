{ pkgs, ... }:

{
  users.users.nacho.packages = with pkgs; [
    autotiling
    wofi
    pulseaudio
    pavucontrol
    swaylock
    nnn
  ];
}
