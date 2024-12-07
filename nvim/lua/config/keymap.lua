vim.keymap.set("i", "jj", "<esc>")
vim.keymap.set("i", "kk", "<esc>")

local telescope_builtin = require("telescope.builtin")
local function find_files_in_git_root()
    local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
    if vim.v.shell_error ~= 0 then
        git_root = nil -- If not in a Git repo, fallback to default behavior
    end
    telescope_builtin.find_files({
        cwd = git_root,
    })
end

vim.keymap.set("n", "<leader><leader>", find_files_in_git_root, {desc = "Find in Project Root"})
vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, {desc = "Find in cwd"})

vim.keymap.set("n", "<leader>qq", "<cmd>q<cr>")
vim.keymap.set("n", "<leader>qQ", "<cmd>q!<cr>")
vim.keymap.set("n", "<leader>qw", "<cmd>wq<cr>")