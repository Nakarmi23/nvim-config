require("neo-tree").setup {
  window = {
    position = "right"
  },
  event_handlers = {
    {
      event = "before_move",
      handler = function(args)
        -- Use window picker to select target window for file move
        local picker = require("window-picker")
        local picked_window_id = picker.pick_window() -- Prompt to pick a window
        if picked_window_id then
          vim.api.nvim_set_current_win(picked_window_id)
        else
          vim.notify("No window selected!", vim.log.levels.WARN)
        end
      end,
    },
  },
  filesystem = {
    window = {
      mappings = {
        -- Example: Use 'm' to move a file with window picker
        ["m"] = function(state)
          local node = state.tree:get_node() -- Get the selected file/directory node
          if not node or node.type ~= "file" then
            vim.notify("Please select a file!", vim.log.levels.WARN)
            return
          end

          local filepath = node.path -- Get the full path of the selected file

          -- Use window picker to select a target window
          local picker = require("window-picker")
          local target_window = picker.pick_window()
          if not target_window then
            vim.notify("No window selected!", vim.log.levels.WARN)
            return
          end

          -- Set the selected window as the current window
          vim.api.nvim_set_current_win(target_window)

          -- Open the file in the selected window
          vim.cmd("edit " .. vim.fn.fnameescape(filepath))
        end,
      },
    },
  },
}

vim.keymap.set("n", "<leader>b", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
