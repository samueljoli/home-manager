{
    description = "My Home Manager Flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        plugin-cyberpunk-nvim = {
          url = "github:samueljoli/cyberpunk.nvim";
          flake = false;
        };
        plugin-yazi-nvim = {
          url = "github:mikavilpas/yazi.nvim";
          flake = false;
        };
        plugin-heirline-components = {
          url = "github:Zeioth/heirline-components.nvim";
          flake = false;
        };
    };

    outputs = {nixpkgs, home-manager, ...}@inputs: {

        defaultPackage.aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;

        homeConfigurations = {
            "sjoli" = home-manager.lib.homeManagerConfiguration {
                pkgs = import nixpkgs { system = "aarch64-darwin"; };

                modules = [ ./home-manager/default.nix ];

                extraSpecialArgs = { inherit inputs; };
            };
        };
    };
}
