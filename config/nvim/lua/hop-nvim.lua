-- place this in one of your configuration file(s)
local hop = require('hop')
hop.setup()
local directions = require('hop.hint').HintDirection

vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })

vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })

vim.keymap.set('', 't', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })

vim.keymap.set('', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { remap = true })

vim.keymap.set('', '«', function()
  hop.hint_line({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })

vim.keymap.set('', 'ç', function()
  hop.hint_lines_skip_whitespace()
end, { remap = true })
