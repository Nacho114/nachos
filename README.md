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

### home-manager: switch --flake .  xdg-desktop-portal-gtk.service loaded failed failed Portal service (GTK/GNOME implementation)

Make sure yo reboot before, you should not have logged out of GNOME.

