# nachOS

Make sure to add any new files to git!

Here are bunch of useful commands and faq of common issues!

## Structure

- Flake: This keeps track of a lock file to pin all versions
- Home-manager: This is to manage all things related to user, dev env, apps, ...

This structure makes it easy to

1. Pin changes and updates
2. Keep apps and dev env at the user level

## Upgrade

Note, when running `switch`, this will build the system based on the latest
lock file, hence the need to update it. 

1. Update lock file, this will get the latest versions
```shell
nix flake update
```

2. Update from config
```shell
sudo nixos-rebuild switch --flake .
```

3. Update home manager
```shell
home-manager switch --flake .
```

## Clean

These are already automated inside the configuration.nix!

Garbage collect
```shell
nix-collect-garbage
```
Remove generations older than 4d
```shell
sudo nix-collect-garbage --delete-older-than 4d
```

Update the login generation options, note the use of `boot`
```shell
sudo nixos-rebuild boot --flake .
```

## FAQ

Some general things to check

- make sure you added the file to git! Else the file is ignored during switch

### Nix flakes /nix/store/***-source no such file or directory

[some solutions](https://discourse.nixos.org/t/nix-flakes-nix-store-source-no-such-file-or-directory/17836)

- do `git add` and retry

### `Original error was: libz.so.1: cannot open shared object file: No such file or directory`

Nix works by building things in a declarative way to ensure everything is predictable. However some software 
ships with pre-compiled ejecutables that were not made for Nix. E.g. `numpy` uses some C libraries for the 
computations. 

These programs will look for a link-loader program (e.g. libz.so.1) in `/lib64/`, which is the default location
for linked-loaders However nix stores these in the nix store!

It installs a shim layer that mimics the standard link-loader path and uses NIX_LD to point to the actual loader, setting LD_LIBRARY_PATH to include required libraries specified in NIX_LD_LIBRARY_PATH.

To understand more look at this [article](https://blog.thalheim.io/2022/12/31/nix-ld-a-clean-solution-for-issues-with-pre-compiled-executables-on-nixos/)

### home-manager: switch --flake .  xdg-desktop-portal-gtk.service loaded failed failed Portal service (GTK/GNOME implementation)

Make sure yo reboot before, you should not have logged out of GNOME.

### LSP server

Mason in nvim does not work well with Nix since some of the LSP's are pre-compiled binaries. [Info explained here](https://blog.thalheim.io/2022/12/31/nix-ld-a-clean-solution-for-issues-with-pre-compiled-executables-on-nixos/)

A way around this is to:

1. Add the LSP manually in home manager, e.g. dev.md
2. Add it to [lsp-zero](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
