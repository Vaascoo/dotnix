require'FTerm'.setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})

local modes = {"n", "t", "i"}

for _, mode in ipairs(modes) do
  pcall(vim.keymap.del, mode, '<c-t>')
end

vim.keymap.set('n', '<c-t>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<c-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('i', '<c-t>', '<Esc><CMD>lua require("FTerm").toggle()<CR>')
