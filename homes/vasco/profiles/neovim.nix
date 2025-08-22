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
    ansible-language-server
    astro-language-server
    clang-tools_15
    crystalline
    gopls
    java-language-server
    nil
    pyright
    rust-analyzer
    sumneko-lua-language-server
    tailwindcss-language-server
    terraform-lsp
    tinymist
    typst-fmt
  ];

  cmpPlugins = with pkgs.vimPlugins; [
    lspkind-nvim
    cmp-nvim-lsp
    cmp-treesitter
    cmp-buffer
    cmp-path
    cmp-cmdline
    cmp-git
    nvim-lspconfig
    nvim-treesitter
  ];

  vibePlugins = with pkgs.vimPlugins; [
    dressing-nvim
    nui-nvim
    render-markdown-nvim
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
    plugins = with pkgs.vimPlugins;
      [
        nvim-lint
        nvim-web-devicons
        plenary-nvim
        markdown-preview-nvim
        vim-nix
        rainbow-delimiters-nvim
        luasnip
        {
          plugin = mini-icons;
          type = "lua";
          config = ''
            require("mini.icons").setup()
          '';
        }
        {
          plugin = FTerm-nvim;
          type = "lua";
          config = builtins.readFile "${configDir}/nvim/lua/term.lua";
        }
        # {
        #   plugin = zellij-nav-nvim;
        #   type = "lua";
        #   config = builtins.readFile "${configDir}/nvim/lua/zellij.lua";
        # }
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
      ]
      ++ cmpPlugins ++ vibePlugins;

    extraLuaPackages = ps: with ps; [lua-lsp];

    extraLuaConfig = builtins.readFile "${configDir}/nvim/init.lua";
  };
}
