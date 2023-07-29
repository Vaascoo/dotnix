# Dotfiles
My personal configuration for my NixOS hosts along with my Home-Manager configurations and some dev shells.
A little bit overengineered considering I don't have a lot of machines.

## Deploying
```sh
git clone https://github.com/Vaascoo/dotnix.git
cd nixconf
# Something along the lines of:
nixos-install --flake '.#<host>'
nixos-rebuild switch --flake '.#<host>'
```

