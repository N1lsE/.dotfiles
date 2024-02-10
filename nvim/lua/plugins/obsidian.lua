return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre ~/Documents/nvim-obsidian-test/**.md",
  --   "BufNewFile ~/Documents/nvim-obsidian-test/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- optional, for completion.
    "hrsh7th/nvim-cmp",

    -- Optional, for search and quick-switch functionality.
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/nvim-obsidian-test/**.md",
      },
      -- {
      --   name = "work",
      --   path = "~/vaults/work",
      -- },
    },

    -- see below for full list of options 👇

    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      vim.keymap.set("n", "<leader>of", ":ObsidianFollowLink<CR>"),
      vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>"),
      vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>"),
      vim.keymap.set("n", "<leader>oo", ":ObsidianSearch<CR>"),
      vim.keymap.set("n", "<leader>oO", ":ObsidianOpen<CR>"),
      vim.keymap.set("n", "<leader>oI", ":ObsidianPasteImg<CR>"),
      -- vim.keymap.set("n", "<leader>or", ":ObsidianRename"),
      vim.keymap.set("v", "<leader>ol", ":ObsidianLink<CR>"),
      vim.keymap.set("v", "<leader>oL", ":ObsidianLinkNew<CR>"),
    },

    -- Optional, customize how names/IDs for new notes are created.
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,
  },
}
