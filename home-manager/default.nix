{ config, pkgs, inputs, ... }:

{
  home = {
    # make dynamic or override in work flake
    username = "sjoli";
    homeDirectory = "/Users/sjoli";  # paths that will be managed by home-manager
    stateVersion = "23.11";
    sessionVariables = {
      # NOTE: What should be here
    };
    packages = import ./packages.nix { inherit pkgs; };
  };
  nixpkgs = {
    overlays = [
      (final: prev: {
        vimPlugins = prev.vimPlugins // {
          foreign-yazi-nvim = prev.vimUtils.buildVimPlugin {
            name = "yazi";
            src = inputs.plugin-yazi-nvim;
          };
          foreign-cyberpunk-nvim = prev.vimUtils.buildVimPlugin {
            name = "cyberpunk";
            src = inputs.plugin-cyberpunk-nvim;
          };
          foreign-heirline-components = prev.vimUtils.buildVimPlugin {
            name = "heirline-components";
            src = inputs.plugin-heirline-components;
          };
        };
      })
    ];
  };

  programs = import ./programs.nix { inherit pkgs; };
}
