{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      neo-tree-nvim          # replaces oil-nvim
      nui-nvim               # required by neo-tree
      toggleterm-nvim
      telescope-nvim
      telescope-fzf-native-nvim
      plenary-nvim
      nvim-web-devicons
    ];
    initLua = ''
      vim.g.mapleader = " "
      vim.opt.number = true
      vim.opt.relativenumber = false
      vim.opt.termguicolors = true
      vim.opt.splitbelow = true
      vim.opt.splitright = true
      vim.opt.hidden = true

      -- Icons
      require("nvim-web-devicons").setup({
        default = true,
        override = {
          nix = {
            icon = "󱄅",
            color = "#7ebae4",
            name = "Nix",
          },
        },
        override_by_extension = {
          ["lock"] = {
            icon = "",
            color = "#e8274b",
            name = "Lock",
          },
        },
      })

      -- Telescope
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      telescope.setup({
        extensions = {
          fzf = {},
        },
        defaults = {
          layout_strategy = "horizontal",
          layout_config = { preview_width = 0.55 },
        },
      })
      telescope.load_extension("fzf")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep,  { desc = "Live grep (search project)" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers,    { desc = "Find buffers" })
      vim.keymap.set("n", "<leader>/",  builtin.live_grep,  { desc = "Search project" })

      -- Neo-tree
      require("neo-tree").setup({
        close_if_last_window = true,
        window = {
          position = "left",
          width = 30,
        },
        filesystem = {
          filtered_items = {
            visible = true,       -- show hidden files (dimmed rather than hidden)
            hide_dotfiles = false,
            hide_gitignored = false,
          },
          follow_current_file = {
            enabled = true,       -- highlight the file open in the main window
          },
          use_libuv_file_watcher = true,
        },
        default_component_configs = {
          icon = {
            folder_closed = "\u{E5FF}",
            folder_open = "\u{E5FF}",
            folder_empty = "\u{E5FF}",
          },
          git_status = {
            symbols = {
              added     = "",
              modified  = "",
              deleted   = "✖",
              renamed   = "󰁕",
              untracked = "",
              ignored   = "",
              unstaged  = "󰄱",
              staged    = "",
              conflict  = "",
            },
          },
        },
      })
      -- Toggle explorer (same <leader>e binding you had before)
      vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>",                   { desc = "Toggle file explorer" })
      -- Reveal current file in the tree (replaces the old `-` oil binding)
      vim.keymap.set("n", "-",         "<cmd>Neotree reveal<CR>",                   { desc = "Reveal file in explorer" })

      -- Toggleterm
      require("toggleterm").setup({
        open_mapping = [[<c-\>]],
        direction = "float",
        shade_terminals = true,
        float_opts = {
          border = "rounded",
        },
      })
      vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>",                       { desc = "Toggle floating terminal" })
      vim.keymap.set("t", "<leader>t", [[<C-\><C-n><cmd>ToggleTerm<CR>]],           { desc = "Toggle floating terminal" })
    '';
  };
}