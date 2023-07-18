local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
   { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
   { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
   -- more mappings here
}
