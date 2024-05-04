# nachOS

Make sure to add any new files to git!

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
From [here](https://www.reddit.com/r/NixOS/comments/10107km/how_to_delete_old_generations_on_nixos/)

To further optimize, I could add this to the configuration.nix
```nix
nix.settings.auto-optimise-store = true;
nix.gc = {
  automatic = true;
  dates = "weekly";
  options = "-d";
  persistent = true;
};
```

## FAQ

Some general things to check

- make sure you added the file to git! Else the file is ignored during switch

### home-manager: switch --flake .  xdg-desktop-portal-gtk.service loaded failed failed Portal service (GTK/GNOME implementation)

Make sure yo reboot before, you should not have logged out of GNOME.

