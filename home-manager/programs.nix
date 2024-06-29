{ pkgs }:

{
  home-manager = {
    enable = true;
  };

  direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  neovim = import ./neovim/default.nix { inherit (pkgs) vimPlugins; };
}
