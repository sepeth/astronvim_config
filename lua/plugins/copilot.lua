vim.keymap.set('i', '<C-e>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
  noremap = true,
  -- silent = true
})

vim.g.copilot_no_tab_map = true

---@type LazySpec
return {
  "github/copilot.vim",
}
