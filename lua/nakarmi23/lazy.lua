local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.opt.autochdir = false -- Prevents auto-opening the current directory

require("lazy").setup({
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
    }
  },
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      vim.cmd('TSUpdate')
    end
  },
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.dashboard'.config)

      -- Check if any buffer is listed and has content
      local listed_buffers = vim.tbl_filter(function(buf)
        local bufname = vim.api.nvim_buf_get_name(buf)
        return vim.api.nvim_buf_is_valid(buf)
            and vim.bo[buf].buflisted
            and bufname ~= ""                   -- Ignore empty unnamed buffers
            and not vim.fn.isdirectory(bufname) -- Ignore directories
      end, vim.api.nvim_list_bufs())

      -- Start Alpha.nvim only if no files or buffers are open and no valid arguments are passed
      if #vim.fn.argv() == 0 and #listed_buffers == 0 then
        require("alpha").start()
        -- Open Neo-tree after Alpha starts
        vim.defer_fn(function()
          vim.cmd("Neotree show")
        end, 100) -- Small delay to ensure Alpha loads first
      elseif vim.fn.argv(0) and vim.fn.isdirectory(vim.fn.argv()[1]) == 1 then
        -- Open the directory in Neo-tree if a directory is passed
        vim.defer_fn(function()
          vim.cmd("Neotree show")
        end, 100)
      end
    end,
    lazy = false,
    priority = 1000, -- Ensure it loads before other plugins
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  { 'nvim-treesitter/playground' },
  { 'theprimeagen/harpoon' },
  { 'mbbill/undotree' },
  { 'tpope/vim-fugitive' },
  { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/nvim-cmp' },
  { 'L3MON4D3/LuaSnip' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'windwp/nvim-ts-autotag' },
  { 'windwp/nvim-autopairs' },
  { 'lewis6991/gitsigns.nvim' },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  -- {
  --   'nvim-tree/nvim-tree.lua',
  --   version = "*",
  --   lazy = false,
  -- },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information

    }
  },
  {
    's1n7ax/nvim-window-picker',
    version = '2.*',
  },
  {
    "MunifTanjim/nui.nvim"
  },
  {
    "numToStr/Comment.nvim",
    lazy = false,
  },
  {
    'codota/tabnine-nvim', build = "./dl_binaries.sh"
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  }
})
