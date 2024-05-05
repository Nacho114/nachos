{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # dotfile manager
    chezmoi

    trash-cli

    # git
    delta
    
    # general utilities
    wl-clipboard
    tmux
    tldr
    bat 
    tree
    fzf
    ripgrep
    fd
    bottom
    neofetch

    # fish dependency
    zoxide

    # neovim dependency
    gcc
    cargo
    luarocks
    nodejs_21
    neovim
  ];
}
