# 🏠 Lakay

Nix flake containing basic binaries and collection of dotfiles.

## Installation
`todo:`

## Usage
**Adding a package**

Packages are defined in `home.nix`
```nix
  home.packages = [
    # Networking
    pkgs.oha # ----------- HTTP load generator
    pkgs.tailscale # ----- The node agent for Tailscale, a mesh VPN built on WireGuard
  ];
```
Simply add a new `pkg` to array and run the following in your terminal:
```bash
home-manager switch --flake .
```

## Helpful links
- [`nix pkg repository`](https://search.nixos.org/packages)
- [`home-manager options`](https://home-manager-options.extranix.com/) 
