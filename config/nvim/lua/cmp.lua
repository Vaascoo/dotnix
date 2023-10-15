local nvim_lsp = require('lspconfig')
local luasnip = require('luasnip')
local lspkind = require('lspkind')
local cmp = require 'cmp'
local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp_kinds = {
  Class         = " ",
  Color         = " ",
  Constant      = " ",
  Constructor   = " ",
  Enum          = " ",
  EnumMember    = " ",
  Event         = "a ",
  Field         = "ﰠ ",
  File          = " ",
  Folder        = " ",
  Function      = " ",
  Interface     = " ",
  Keyword       = " ",
  Method        = " ",
  Module        = " ",
  Operator      = " ",
  Property      = " ",
  Reference     = " ",
  Snippet       = " ",
  Struct        = "פּ ",
  Text          = " ",
  TypeParameter = " ",
  Unit          = " ",
  Value         = " ",
  Variable      = " ",
}

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      if not luasnip then
        return
      end
      luasnip.lsp_expand(args.body)
    end,
  },

  formatting = {
    -- format = function(_, vim_item)
    --   vim_item.kind = (cmp_kinds[vim_item.kind] or "") .. vim_item.kind
    --   return vim_item
    -- end,
    format = lspkind.cmp_format({
      mode = "symbol_text",
      menu = ({
        nvim_lsp = "[LSP]",
        ultisnips = "[US]",
        nvim_lua = "[Lua]",
        path = "[Path]",
        buffer = "[Buffer]",
        emoji = "[Emoji]",
        omni = "[Omni]",
      }),
    }),

  },

  mapping = {
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable,
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<CR>"] = cmp.mapping.confirm { select = false },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
    { name = 'orgmode' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

require('lspconfig')['lua_ls'].setup {
  capabilities = capabilities,
  on_attach = require 'generic_lsp'
}


require('lspconfig')['eslint'].setup {
  capabilities = capabilities,
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "jsx",
    "html"
  },
  on_attach = require 'generic_lsp'
}
require('lspconfig')['clangd'].setup {
  capabilities = capabilities,
  on_attach = require 'generic_lsp'
}

require('lspconfig')['java_language_server'].setup {
  capabilities = capabilities,
  on_attach = require 'generic_lsp',
  cmd = { 'java-language-server' }
}

require 'lspconfig'.kotlin_language_server.setup {
  capabilities = capabilities,
  on_attach = require 'generic_lsp'
}

require 'lspconfig'.tsserver.setup {
  capabilities = capabilities,
  on_attach = require 'generic_lsp'
}

require('lspconfig')['pyright'].setup {
  capabilities = capabilities,
  on_attach = require 'generic_lsp'
}

require('lspconfig')['nixd'].setup {
  capabilities = capabilities,
  on_attach = require 'generic_lsp'
}

require('lspconfig')['gopls'].setup {
  capabilities = capabilities,
  on_attach = require 'generic_lsp'
}

require('lspconfig')['rust_analyzer'].setup {
  capabilities = capabilities,
  on_attach = require 'generic_lsp'
}

require('lspconfig')['bashls'].setup {
  capabilities = capabilities,
  on_attach = require 'generic_lsp'
}

require('lspconfig')['ansiblels'].setup {
  capabilities = capabilities,
  on_attach = require 'generic_lsp'
}

require('lspconfig')['terraform_lsp'].setup {
  capabilities = capabilities,
  on_attach = require 'generic_lsp'
}
