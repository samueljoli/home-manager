{ pkgs }:

{
  home-manager = {
    enable = true;
  };

  git = import ./git.nix { inherit pkgs; };

  gpg = {
    enable = true;
  };

  direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  neovim = import ./neovim/default.nix { inherit (pkgs) vimPlugins; };

  starship = import ./starship.nix { inherit pkgs; };

  zsh = import ./zsh.nix { inherit pkgs; };
}
