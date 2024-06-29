{ config, pkgs, inputs, ... }:

{
  home.username = "sjoli";
  home.homeDirectory = "/Users/sjoli";  # paths that will be managed by home-manager

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Home Manager release that your configuration is compatible with.

  home.packages = [
    # Networking
    pkgs.oha # ----------- HTTP load generator
    pkgs.tailscale # ----- The node agent for Tailscale, a mesh VPN built on WireGuard

    # Productivity
    pkgs.bat # ----------- A cat(1) clone with syntax highlighting and Git integration
    pkgs.fzf # ----------- A command-line fuzzy finder written in Go
    pkgs.ripgrep # ------------ grep
    pkgs.yazi # ---------- Terminal file manager
    pkgs.just

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/sjoli/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs = {
   overlays = [
      (final: prev: {
	 vimPlugins = prev.vimPlugins // {
	  foreign-cyberpunk-nvim = prev.vimUtils.buildVimPlugin {
	    name = "cyberpunk";
	    src = inputs.plugin-cyberpunk;
	  };
        };
      })
    ];
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.neovim =
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraLuaConfig = ''
      ${builtins.readFile ./nvim/options.lua}
    '';
    plugins = with pkgs.vimPlugins; [
      {
        plugin = hop-nvim;
        config = toLuaFile ./nvim/plugin/hop.lua;
      }
      {
        plugin = telescope-nvim;
        config = toLuaFile ./nvim/plugin/telescope.lua;
      }
      telescope-fzf-native-nvim
      telescope-ui-select-nvim

      vim-nix
      vim-nix
      plenary-nvim
      nvim-web-devicons
    ];
  };
}
