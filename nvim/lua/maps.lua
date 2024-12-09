local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', 'fg', builtin.live_grep, { desc = 'Telescope live grep' })

vim.api.nvim_set_keymap('n', 'ss', ':vsplit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'sf', ':split<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tn', ':tabnew<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tl', ':tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'th', ':tabprev<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>h', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>j', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>k', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>l', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gs', ':Neogit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>q', ':vertical resize +10<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>r', ':vertical resize -10<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>e', ':resize +10<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>w', ':resize -10<CR>', { noremap = true })
--vim.api.nvim_set_keymap('n', '<Leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true })

vim.g['copilot_no_tab_map'] = true
vim.g['copilot_assume_mapped'] = true
vim.api.nvim_set_keymap('i', '<C-h>', 'copilot#Accept("<CR>")', { expr = true, silent = true })


-- Enable copy and paste from clipboard
if vim.fn.has("wsl") == 1 then 
    vim.g.clipboard = {
        name = 'WslClipboard',
        copy = {
            ['+'] = 'clip.exe',
            ['*'] = 'clip.exe',
        },
        paste = {
            ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = 0
    }
end
