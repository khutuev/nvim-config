return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- поиск по файла
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})  -- поиск по слова
        vim.keymap.set('n', '<leader>fq', builtin.treesitter, {}) -- поиск по переменным и функциям в файле
        vim.keymap.set('n', '<leader>fi', function() require("trouble").toggle("lsp_references") end, {})
        vim.keymap.set('n', '<leader>ftd', builtin.lsp_type_definitions, {})
        vim.keymap.set('n', '<leader>fd', function() builtin.lsp_definitions({jump_type = "never"}) end, {})

        vim.keymap.set('n', '<leader>gcc', builtin.git_commits, {})
        vim.keymap.set('n', '<leader>gcb', builtin.git_bcommits, {})
        vim.keymap.set('n', '<leader>gs', builtin.git_status, {})

        vim.api.nvim_set_keymap('n', '<leader>fp', '<Cmd>Telescope neovim-project history<CR>', { noremap = true, silent = true })
    end
}
