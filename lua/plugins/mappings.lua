return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>bl"] = { "<C-^>", desc = "Switch to last buffer" },
          ["<Leader><Leader>"] = { "<Leader>fb", desc = "Show buffers", remap = true },
          ["<D-k>"] = {
            ':lua require("dash").search(true, vim.fn.expand("<cword>"))<CR>',
            desc = "Find the word under the cursor in Dash",
          },
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
      },
    },
  },
}
