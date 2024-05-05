{ ... }:

{
  imports = [
    ./apps.nix
    ./dev.nix
    ./foot.nix
    ./wm-utils.nix
    ./nix-your-shell.nix
  ];

  # Required for megasync
  nixpkgs.config.allowUnfree = true;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nacho";
  home.homeDirectory = "/home/nacho";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
