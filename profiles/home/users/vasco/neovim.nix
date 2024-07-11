{
  configDir,
  pkgs,
  ...
}: let
  nodePkgs = with pkgs.nodePackages; [
    eslint
    vscode-langservers-extracted
    typescript-language-server
    bash-language-server
    typescript
  ];
in {
  home.packages = with pkgs; [
    shellcheck
    ansible-lint
    typst
    go
  ];
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withPython3 = true;
    plugins = with pkgs.vimPlugins; [
      copilot-cmp
      copilot-lua
      plenary-nvim
      nvim-treesitter
      markdown-preview-nvim
      vim-nix
      lspkind-nvim
      cmp-nvim-lsp
      cmp-treesitter
      cmp-git
      pkgs.latest.vimPlugins.nvim-lspconfig
      molokai
      rainbow-delimiters-nvim
      {
        plugin = copilot-lua;
        type = "lua";
        config = builtins.readFile "${configDir}/nvim/lua/copilot.lua";
      }
      {
        plugin = Navigator-nvim;
        type = "lua";
        config = builtins.readFile "${configDir}/nvim/lua/navigator.lua";
      }
      {
        plugin = gruvbox-nvim;
        type = "lua";
        config = ''
          vim.o.brackground = "dark"
          require("gruvbox").setup({
            transparent_mode = true,
          })
          vim.cmd([[colorscheme gruvbox]])
        '';
      }
      {
        plugin = hop-nvim;
        type = "lua";
        config = builtins.readFile "${configDir}/nvim/lua/hop-nvim.lua";
      }
      {
        plugin = orgmode;
        type = "lua";
        config = builtins.readFile "${configDir}/nvim/lua/orgmode.lua";
      }
      {
        plugin = harpoon;
        type = "lua";
        config = builtins.readFile "${configDir}/nvim/lua/harpoon.lua";
      }
      {
        plugin = telescope-nvim;
        type = "lua";
        config = builtins.readFile "${configDir}/nvim/lua/telescope.lua";
      }
      {
        plugin = luasnip;
        type = "lua";
        config = builtins.readFile "${configDir}/nvim/lua/luasnip.lua";
      }
      {
        plugin = nvim-surround;
        type = "lua";
        config = builtins.readFile "${configDir}/nvim/lua/surround.lua";
      }
      {
        plugin = nvim-cmp;
        type = "lua";
        config = builtins.readFile "${configDir}/nvim/lua/cmp.lua";
      }
      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = builtins.readFile "${configDir}/nvim/lua/treesitter.lua";
      }
      {
        plugin = lualine-nvim;
        type = "lua";
        config = builtins.readFile "${configDir}/nvim/lua/lualine.lua";
      }
    ];

    extraPackages = with pkgs;
      [
        pyright
        nil
        sumneko-lua-language-server
        rust-analyzer
        clang-tools_15
        gopls
        java-language-server
        ansible-language-server
        terraform-lsp
        typst-lsp
        typst-fmt
      ]
      ++ nodePkgs;

    extraLuaPackages = ps: with ps; [lua-lsp];

    extraPython3Packages = ps: with ps; [];

    extraConfig = builtins.readFile "${configDir}/nvim/init.vim";
  };
}
