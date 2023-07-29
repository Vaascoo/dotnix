local harpoon = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set('n', '<leader>mf', harpoon.add_file, {})
vim.keymap.set('n', '<leader>sm', ui.toggle_quick_menu, {})
vim.keymap.set('n', '<leader>nm', ui.nav_next, {})
vim.keymap.set('n', '<leader>pm', ui.nav_prev, {})
