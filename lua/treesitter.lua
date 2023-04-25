require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
        disable = { "c", "rust", "vim" },
    },
    ensure_installed = { "cxc", "lua", "vim", "help", "query", "rust", "c" },
}

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.cxc = {
    install_info = {
        url = "https://github.com/amjoshuamichael/tree-sitter-cxc",
        files = {"src/parser.c"},
        -- optional entries:
        branch = "main",
    },

    filetype = "cxc",
}

local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
ft_to_parser.cxc = "cxc"

-- ensure that, when we open a .cxc file, we set the syntax & filetype to cxc

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead", "BufEnter"}, {
    pattern = {"*.cxc"},
    command = "set filetype=cxc | set syntax=cxc",
})

--require("vim.treesitter.query").set_query("cxc", "highlights", "(comment) @comment")
