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
  lsps = with pkgs; [
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
    crystalline
  ];
in {
  home.packages = with pkgs;
    [
      shellcheck
      ansible-lint
      typst
      go
      gleam
      erlang
    ]
    ++ lsps
    ++ nodePkgs;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withPython3 = true;
    plugins = with pkgs.vimPlugins; [
      plenary-nvim
      nvim-treesitter
      markdown-preview-nvim
      vim-nix
      lspkind-nvim
      cmp-nvim-lsp
      cmp-treesitter
      cmp-git
      pkgs.latest.vimPlugins.nvim-lspconfig
      rainbow-delimiters-nvim
      luasnip
      {
        plugin = FTerm-nvim;
        type = "lua";
        config = builtins.readFile "${configDir}/nvim/lua/term.lua";
      }
      {
        plugin = Navigator-nvim;
        type = "lua";
        config = builtins.readFile "${configDir}/nvim/lua/navigator.lua";
      }
      {
        plugin = kanagawa-nvim;
        type = "lua";
        config = builtins.readFile "${configDir}/nvim/lua/kanagawa.lua";
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
      {
        plugin = rose-pine;
        type = "lua";
        config = builtins.readFile "${configDir}/nvim/lua/colors.lua";
      }
    ];

    extraLuaPackages = ps: with ps; [lua-lsp];

    extraLuaConfig = builtins.readFile "${configDir}/nvim/init.lua";
  };
}
