{pkgs, ...}: {
    home.username = "sjoli";
    home.homeDirectory = "/Users/sjoli";
    home.packages = [
        pkgs.nixpkgs-fmt
        pkgs.cowsay
    ];
    home.stateVersion = "22.11"; # NOTE: is this the right version
    programs.home-manager.enable = true;
}
