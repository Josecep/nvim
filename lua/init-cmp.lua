local luasnip = require 'luasnip'
require("luasnip/loaders/from_vscode").lazy_load({ paths = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets" } })
local cmp = require('cmp')
cmp.setup {
    snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm { select = true }
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' }
  }
}

require('nvim-autopairs').setup()

-- you need setup cmp first put this after cmp.setup()
require("nvim-autopairs.completion.cmp").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` after select function or method item
  auto_select = true -- automatically select the first item
})

-- init surround
require('surround').setup {}

-- init comment
require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
})

