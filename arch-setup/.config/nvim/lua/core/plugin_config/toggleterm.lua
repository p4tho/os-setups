require("toggleterm").setup {
  vim.keymap.set("n", "<M-1>", "<cmd>ToggleTerm 1<CR>", { desc = "Terminal 1" }),
  vim.keymap.set("n", "<M-2>", "<cmd>ToggleTerm 2<CR>", { desc = "Terminal 2" }),
  vim.keymap.set("n", "<M-3>", "<cmd>ToggleTerm 3<CR>", { desc = "Terminal 3" }),

  close_on_exit = true,
  persist_mode = false,
}

