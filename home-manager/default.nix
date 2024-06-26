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
  programs = import ./programs.nix { inherit pkgs; };
}
