-- Zoom in/out should work in Neovide
if vim.g.neovide == true then
  vim.keymap.set(
    "n",
    "<D-=>",
    ":lua vim.g.neovide_scale_factor = math.min(vim.g.neovide_scale_factor + 0.1, 2.5)<CR>",
    { silent = true }
  )
  vim.keymap.set(
    "n",
    "<D-->",
    ":lua vim.g.neovide_scale_factor = math.max(vim.g.neovide_scale_factor - 0.1, 0.5)<CR>",
    { silent = true }
  )
  vim.keymap.set("n", "<D-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end

-- Buffer size keymaps
vim.keymap.set("n", "<C-->", ":horizontal resize -4<CR>", { silent = true })
vim.keymap.set("n", "<C-+>", ":horizontal resize +4<CR>", { silent = true })
vim.keymap.set("n", "<C-<>", ":vertical resize -4<CR>", { silent = true })
vim.keymap.set("n", "<C->>", ":vertical resize +4<CR>", { silent = true })

-- Quickly create/open a new file in the same directory
vim.keymap.set("c", "%%", "<C-R>=expand('%:p:h').'/'<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>s", ":e %%", { desc = "Create/Open a file in the same dir" })

vim.keymap.set("n", "<Leader>z", ":ZenMode<CR>", { desc = "Zen Mode" })

---@type LazySpec
return {

  "andweeb/presence.nvim",

  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        height = 0.95,
      },
    },
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header

      opts.section.header.val = {
        "⠀⠀⠀⠀⠀⠀⣀⡠⠄⠒⠠⢄⠀⣀⠤⠒⠂⠤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠤⠐⠒⠤⡀⢀⡠⠔⠂⠠⢄⣀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⣠⠞⠂⢀⣀⣀⠀⠀⠉⠁⠀⣀⣀⣀⠀⠑⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⠋⠀⣀⣀⣀⠀⠈⠉⠀⢀⣀⣀⠀⠈⠲⡀⠀⠀⠀⠀",
        "⠀⠀⠀⣸⡏⠀⣴⢋⠤⢌⠙⠆⠀⢠⠎⢁⠤⠍⢧⠀⠀⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡿⠁⢠⡞⡡⠤⡉⠳⠀⠀⡴⠉⡠⠬⡹⡄⠀⢸⡄⠀⠀⠀",
        "⠀⠀⢀⣽⡁⠀⣿⡀⢀⡘⡄⡇⠀⢸⢢⠇⢀⢢⣺⠀⠀⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣨⣇⠀⢸⣏⠀⡐⢣⢸⠀⠀⡗⡜⢀⠐⣄⣧⠀⢸⣇⠀⠀⠀",
        "⠀⣰⠉⠙⠷⠀⢛⣟⣦⣄⣣⡇⠀⠘⣎⣰⣤⣾⡿⠁⠴⠋⠈⠱⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡎⠉⠻⠆⠈⣿⣳⣤⣙⣼⠂⠀⢻⣁⣦⣼⣿⠇⠠⠞⠁⠙⣆⠀",
        "⣺⠁⠀⣠⠒⠶⣄⠉⠓⢚⣣⡠⠤⢤⣈⡓⠛⠋⢠⠖⠲⢤⡀⠀⢷⠀⠀⠀⠀⠀⠀⠀⢐⡟⠀⢀⠔⠲⢦⡈⠑⠛⣋⣡⠤⠤⣄⣙⠚⠛⢁⡴⠒⠦⣄⠀⠨⡆",
        "⣽⠀⢸⠄⠣⡐⢹⠀⡤⠏⢁⢀⢀⠠⢀⠉⢦⡀⢹⡁⠔⡁⣗⠀⢸⡅⠀⠀⠀⠀⠀⠀⢸⡇⠀⡗⠘⢄⢈⡇⢠⠖⠉⡀⣀⠠⠄⡈⠳⣄⠈⣟⠠⢈⢸⠀⠀⣿",
        "⠹⣄⠸⣷⣤⣧⠞⣾⢁⠐⢀⠀⠠⠄⣀⠑⠄⢱⡸⣧⣴⣶⡟⢠⡟⠁⠀⠀⠀⠀⠀⠀⠈⢷⡀⢿⣦⣾⡼⢳⡏⡠⠁⡀⠠⠠⢄⠈⠢⠈⣆⢿⣤⢶⣾⠃⣼⠃",
        "⠀⡸⢷⠈⠉⠉⢸⡟⣆⠀⢂⠌⣁⠒⡈⠢⢈⣾⣧⠈⠉⠉⢴⢏⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠿⡆⠉⠉⠁⣾⣳⠀⡀⠆⡑⠄⢂⠙⠄⣱⣿⠀⠉⠉⠡⡾⡅⠀",
        "⠐⡇⠀⠀⠀⠀⠘⣿⡞⣦⣅⣂⣄⣂⣰⣵⣻⣽⠏⠀⠀⠀⠀⢰⡆⠀⠀⠀⠀⠀⠀⠀⠀⢺⠀⠀⠀⠀⠀⢻⣷⢳⣴⣈⣐⣈⣄⣮⣞⣯⡿⠂⠀⠀⠀⠀⣸⠀",
        "⠀⠘⢄⠀⠀⠀⠀⠈⠻⠶⣝⣮⣳⣭⣳⣧⠟⠋⠀⠀⠀⠀⣠⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠣⡀⠀⠀⠀⠀⠙⠷⢮⣽⣭⣻⣜⣷⠾⠛⠁⠀⠀⠀⠀⡼⠃⠀",
        "⠀⠀⠈⡗⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⡠⢾⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⢀⠴⣟⠁⠀⠀",
        "⠀⠀⠀⢸⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠨⡷⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⠇⠀⠀⠀",
        "⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡅⠀⠀⠀",
        "⠀⠀⠀⢽⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡇⠀⠀⠀",

        -- " ╱|、     ",
        -- "(˚ˎ 。7   ",
        -- " |、˜ \\   ",
        -- " じしˍ,)ノ",
      }
      return opts
    end,
  },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      npairs.get_rule("'")[1].not_filetypes = { "scheme", "lisp" }
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },

  { "justinmk/vim-sneak", lazy = false },

  { "Civitasv/cmake-tools.nvim", lazy = false },

  -- See where I am at, or what I am looking at
  {
    "wellle/context.vim",
    init = function()
      vim.g.context_add_mappings = 0
    end
  },

  { "czheo/mojo.vim" },

  { "tpope/vim-surround" },

  { "tpope/vim-unimpaired" },

  { "tpope/vim-fugitive" },

  { "Kapeli/dash.nvim", lazy = false },

  {
    "frankroeder/parrot.nvim",
    dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
    config = function()
      require("parrot").setup {
        providers = {
          gemini = {
            api_key = os.getenv "GEMINI_API_KEY",
          },
        },
      }
    end,
  },
}
