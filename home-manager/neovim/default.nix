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
    ${builtins.readFile ./options.lua}
    ${builtins.readFile ./keymaps.lua}
    ${builtins.readFile ./hop.lua}
    ${builtins.readFile ./telescope.lua}
    ${builtins.readFile ./comment.lua}
    ${builtins.readFile ./gitsigns.lua}
    ${builtins.readFile ./yazi.lua}
    ${builtins.readFile ./cyberpunk.lua}
    ${builtins.readFile ./colorizer.lua}
    ${builtins.readFile ./heirline.lua}
  '';

  plugins = with vimPlugins; [
    vimPlugins.foreign-heirline-components
    comment-nvim
    gitsigns-nvim
    hop-nvim
    nvim-web-devicons
    plenary-nvim
    telescope-fzf-native-nvim
    telescope-nvim
    telescope-ui-select-nvim
    heirline-nvim
    vim-nix
    vim-nix
    vimPlugins.foreign-yazi-nvim
    vimPlugins.foreign-cyberpunk-nvim
    nvim-colorizer-lua
  ];
}
