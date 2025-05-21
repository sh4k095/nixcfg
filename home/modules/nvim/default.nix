{ ... }:

{
  imports = [
    ./settings
    ./plugins
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    plugins = {
      lualine.enable = true;
      nvim-tree.enable = true;
      telescope.enable = true;
      transparent.enable = true;
    };
    performance = {
      combinePlugins = {
        enable = true;
        standalonePlugins = [
          "hmts.nvim"
          "neorg"
          "nvim-treesitter"
        ];
      };
      byteCompileLua.enable = true;
    };
    viAlias = true;
    vimAlias = true;
    luaLoader.enable = true;
  };
}
