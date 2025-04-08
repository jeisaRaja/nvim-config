vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set autoindent")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set foldlevel=20")
vim.cmd("set foldmethod=expr")
vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
vim.opt.clipboard:append("unnamedplus")
vim.cmd("set timeoutlen=1000")
vim.cmd("set ttimeoutlen=10")

vim.filetype.add({
  extension = {
    vert = "glsl",
    frag = "glsl",
    geom = "glsl",
    comp = "glsl",
    tesc = "glsl",
    tese = "glsl",
  }
})

-- Then continue setting up plugins, LSP, etc.




-- tmpl as html
vim.cmd([[ autocmd BufRead,BufNewFile *.tmpl set filetype=html ]])

vim.g.mapleader = " " -- Set leader key to Space

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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
local plugins = {
  { 'akinsho/toggleterm.nvim', version = "*", config = true },
}

require("lazy").setup("plugins")
vim.keymap.set('n', '<C-n>', ':Neotree right<CR>')
vim.keymap.set('n', '<C-t>', '<cmd>exe v:count1 . "ToggleTerm"<CR>')
vim.keymap.set('n', 'gn', ':bnext<CR>')
vim.keymap.set('n', 'gp', ':bprevious<CR>')
-- vim.keymap.set('n', 'gd', ':bdelete<CR>')
vim.keymap.set('n', '<\\>', 'za', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>0', ':b#<CR>')
vim.keymap.set('n', '<leader>p', '"_dP', { noremap = true, silent = true })


-- harpoon
vim.keymap.set('n', '<leader>x', require('harpoon.mark').add_file)
vim.keymap.set('n', '<leader>n', require('harpoon.ui').nav_next)
vim.keymap.set('n', '<leader>p', require('harpoon.ui').nav_prev)
vim.keymap.set('n', [[<leader>m]], ':Telescope harpoon marks<CR>')
vim.keymap.set('n', '<leader>ff', ':Telescope current_buffer_fuzzy_find<CR>')

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
