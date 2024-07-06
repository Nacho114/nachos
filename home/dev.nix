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
    distrobox

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
    tree-sitter # Maybe needed? dockerfile.so wasn't working, maybe due to this, had to uninstall and then install the so

    # New stuff I'm playing around with
    visidata

    # 
    python3
    poetry

  ];
}
