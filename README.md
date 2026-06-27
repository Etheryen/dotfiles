# `/home/etheryen/dotfiles`

My config and alla that.

Run this in `~/dotfiles`:

```sh
stow . -v
```

And for nixos setup:

```sh
sudo rm /etc/nixos/configuration.nix
sudo ln -s ~/dotfiles/configuration.nix /etc/nixos/configuration.nix
```
