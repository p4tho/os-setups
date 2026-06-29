require("diffview").setup({
  use_icons = true,
})

vim.keymap.set("n", "<leader><Tab>", "<cmd>DiffviewOpen<CR>", {
  desc = "Open Diffview",
  silent = true,
})

vim.keymap.set("n", "<leader><S-Tab>", "<cmd>DiffviewClose<CR>", {
  desc = "Close Diffview",
  silent = true,
})
