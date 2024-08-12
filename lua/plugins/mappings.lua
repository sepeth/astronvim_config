return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader><Leader>"] = { "<C-^>", desc = "Switch to last buffer" },
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
