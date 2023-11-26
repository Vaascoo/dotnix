{
  config,
  configDir,
  pkgs,
  ...
}: let
  nodePkgs = with pkgs.nodePackages; [
    eslint
    vscode-langservers-extracted
    typescript-language-server
    bash-language-server
  ];
  treeSitterGrammars = [];
in {
  home.packages = with pkgs; [
    nodePackages.typescript
    shellcheck
    ansible-lint
    typst
    typst-lsp
    typst-fmt
    go
  ];
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withPython3 = true;
    plugins = with pkgs.vimPlugins;
      [
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
        {
          plugin = nvim-ts-rainbow2;
          type = "lua";
          config = ''
            require('nvim-treesitter.configs').setup {
              rainbow = {
                enable = true,
                -- list of languages you want to disable the plugin for
                -- disable = { 'jsx', 'cpp' },
                -- Which query to use for finding delimiters
                query = 'rainbow-parens',
                -- Highlight the entire buffer all at once
                strategy = require('ts-rainbow').strategy.global,
              }
            }
          '';
        }
        {
          plugin = nvim-dap;
          type = "lua";
          config = ''
            local dap = require('dap')
            dap.adapters.python = function(cb, config)
              if config.request == 'attach' then
                ---@diagnostic disable-next-line: undefined-field
                local port = (config.connect or config).port
                ---@diagnostic disable-next-line: undefined-field
                local host = (config.connect or config).host or '127.0.0.1'
                cb({
                  type = 'server',
                  port = assert(port, '`connect.port` is required for a python `attach` configuration'),
                  host = host,
                  options = {
                    source_filetype = 'python',
                  },
                })
              else
                cb({
                  type = 'executable',
                  command = 'path/to/virtualenvs/debugpy/bin/python',
                  args = { '-m', 'debugpy.adapter' },
                  options = {
                    source_filetype = 'python',
                  },
                })
              end
            end
            dap.configurations.python = {
              {
                -- The first three options are required by nvim-dap
                type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
                request = 'launch';
                name = "Launch file";

                -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

                program = "''${file}"; -- This configuration will launch the current file if used.
                pythonPath = function()
                  -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
                  -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
                  -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
                  local cwd = vim.fn.getcwd()
                  if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                    return cwd .. '/venv/bin/python'
                  elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                    return cwd .. '/.venv/bin/python'
                  else
                    return nil
                  end
                end;
              },
            }
          '';
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
      ]
      ++ (with pkgs; [
        vasco.vimPio
      ]);

    extraPackages = with pkgs;
      [
        pyright
        # rnix-lsp
        nil
        sumneko-lua-language-server
        rust-analyzer
        clang-tools_15
        gopls
        java-language-server
        nixd
        ansible-language-server
        terraform-lsp
      ]
      ++ nodePkgs;

    extraLuaPackages = ps:
      with ps; [
        lua-lsp
      ];

    extraPython3Packages = ps:
      with ps; [
      ];

    extraConfig = builtins.readFile "${configDir}/nvim/init.vim";
  };

  home.file."${config.home.homeDirectory}/.config/nvim/lua/generic_lsp.lua".text = ''
          return function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local bufopts = { noremap=true, silent=true, buffer=bufnr }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, bufopts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
      vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
      vim.keymap.set('n', '<space>se', vim.diagnostic.setloclist, bufopts)
      vim.keymap.set('n', '<space>Se', vim.diagnostic.setqflist, bufopts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    end    '';
}
