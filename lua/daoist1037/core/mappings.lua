return {
    {'i', 'jk', '<Esc>' },

    {'n', '<backspace>', '<Cmd>nohl<CR>' },

    -- keep visual selection when (de)indenting
    {'v', '<', '<gv'},
    {'v', '>', '>gv'},

    -- Select last pasted/yanked text 
    {'n', 'g<C-v>', "`[v`]"},

    {'n', 'K', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>" },
    {'n', 'gs', "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>" },
    {'n', 'gr', "<cmd>lua require('lspsaga.rename').rename()<CR>" },
    {'n', 'gd', "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>" },
    {'n', 'gh', "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>" },
--  {'n', '<A-d>', "<cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>" },
--  {'t', '<A-d>', "<C-\\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>" },
--  {'n', '<leader>ld', "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>" },
--  {'n', '<leader>lc', "<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>" },



}
