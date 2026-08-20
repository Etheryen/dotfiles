# `/home/etheryen/dotfiles`

My config and alla that.

Run this in `~/dotfiles`:

```sh
stow . -v
```

And for nixos setup, make this your system `/etx/nixos/configuration.nix`:

```nix
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    /home/etheryen/dotfiles/configuration.nix
  ];
}
```
