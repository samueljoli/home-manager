{ vimPlugins }:

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

  plugins = with vimPlugins; [
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
}
