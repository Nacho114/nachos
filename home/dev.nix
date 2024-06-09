{ pkgs, ... }:

# All the dev tools that I use inside the terminal 
{
  home.packages = with pkgs; [

    # dotfile manager
    chezmoi

    # git
    delta
    
    # general utilities
    trash-cli
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
    neovim
    gcc
    cargo
    luarocks
    nodejs_22
    # installing lsp via nix
    marksman

  ];
}
