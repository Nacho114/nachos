{  pkgs, ... }:
{
  # Does not work in home-manager
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
    # openssl
    # systemd
    # Add any missing library needed
    # You can use the nix-index package to locate them, e.g. nix-locate -w --top-level --at-root /lib/libudev.so.
  ];
}
