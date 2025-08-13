-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- General keymaps
keymap.set("n", "<leader>wq", ":wq<CR>") -- save and quit
keymap.set("n", "<leader>qq", ":q!<CR>") -- quit without saving
keymap.set("n", "<leader>ww", ":w<CR>") -- save
keymap.set("n", "gx", ":!open <c-r><c-a><CR>") -- open URL under cursor

-- Split window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close split window
keymap.set("n", "<leader>sj", "<C-w>-") -- make split window height shorter
keymap.set("n", "<leader>sk", "<C-w>+") -- make split windows height taller
keymap.set("n", "<leader>sl", "<C-w>>5") -- make split windows width bigger 
keymap.set("n", "<leader>sh", "<C-w><5") -- make split windows width smaller

-- Tab management
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open a new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close a tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- previous tab

-- Diff keymaps
keymap.set("n", "<leader>cc", ":diffput<CR>") -- put diff from current to other during diff
keymap.set("n", "<leader>cj", ":diffget 1<CR>") -- get diff from left (local) during merge
keymap.set("n", "<leader>ck", ":diffget 3<CR>") -- get diff from right (remote) during merge
keymap.set("n", "<leader>cn", "]c") -- next diff hunk
keymap.set("n", "<leader>cp", "[c") -- previous diff hunk

-- Quickfix keymaps
keymap.set("n", "<leader>qo", ":copen<CR>") -- open quickfix list
keymap.set("n", "<leader>qf", ":cfirst<CR>") -- jump to first quickfix list item
keymap.set("n", "<leader>qn", ":cnext<CR>") -- jump to next quickfix list item
keymap.set("n", "<leader>qp", ":cprev<CR>") -- jump to prev quickfix list item
keymap.set("n", "<leader>ql", ":clast<CR>") -- jump to last quickfix list item
keymap.set("n", "<leader>qc", ":cclose<CR>") -- close quickfix list

-- Vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle maximize tab

-- Nvim-tree
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>") -- toggle focus to file explorer
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>") -- find file in file explorer

-- Telescope
keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files({ hidden = true }) end, { desc = 'telescope: find in project' }) -- fuzzy find files in project
keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'telescope: live grep' }) -- grep file contents in project
keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = 'telescope: fuzzy find open buffers' }) -- fuzzy find open buffers
keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'telescope: fuzzy find help tags' }) -- fuzzy find help tags
keymap.set('n', '<leader>fs', require('telescope.builtin').current_buffer_fuzzy_find, { desc = 'telescope: fuzzy find in current file buffer' }) -- fuzzy find in current file buffer
keymap.set('n', '<leader>fo', require('telescope.builtin').lsp_document_symbols, { desc = 'telescope: fuzzy find LSP/class symbols' }) -- fuzzy find LSP/class symbols
keymap.set('n', '<leader>fi', require('telescope.builtin').lsp_incoming_calls, { desc = 'telescope: fuzzy find LSP/incoming calls' }) -- fuzzy find LSP/incoming calls
keymap.set('n', '<leader>fm', function() require('telescope.builtin').treesitter({symbols={'function', 'method'}}) end, { desc = 'telescope: fuzzy find methods in current class' }) -- fuzzy find methods in current class
keymap.set('n', '<leader>ft', function() -- grep file contents in current nvim-tree node
  local success, node = pcall(function() return require('nvim-tree.lib').get_node_at_cursor() end)
  if not success or not node then return end;
  require('telescope.builtin').live_grep({search_dirs = {node.absolute_path}})
end, { desc = 'telescope: grep file contents in current nvim-tree node' })
keymap.set('n', '<leader>fk', require('telescope.builtin').keymaps, { desc = 'telescope: fuzzy find in keymappings' }) -- fuzzy find in keymappings

-- Git-blame
keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>") -- toggle git blame

-- Harpoon
keymap.set("n", "<leader>ha", require("harpoon.mark").add_file)
keymap.set("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu)
keymap.set("n", "<leader>h1", function() require("harpoon.ui").nav_file(1) end)
keymap.set("n", "<leader>h2", function() require("harpoon.ui").nav_file(2) end)
keymap.set("n", "<leader>h3", function() require("harpoon.ui").nav_file(3) end)
keymap.set("n", "<leader>h4", function() require("harpoon.ui").nav_file(4) end)
keymap.set("n", "<leader>h5", function() require("harpoon.ui").nav_file(5) end)
keymap.set("n", "<leader>h6", function() require("harpoon.ui").nav_file(6) end)
keymap.set("n", "<leader>h7", function() require("harpoon.ui").nav_file(7) end)
keymap.set("n", "<leader>h8", function() require("harpoon.ui").nav_file(8) end)
keymap.set("n", "<leader>h9", function() require("harpoon.ui").nav_file(9) end)

keymap.set("n", "<C-e>", require("harpoon.ui").toggle_quick_menu)
keymap.set("n", "<C-y>", function() require("harpoon.ui").nav_file(1) end)
keymap.set("n", "<C-t>", function() require("harpoon.ui").nav_file(2) end)
keymap.set("n", "<C-n>", function() require("harpoon.ui").nav_file(3) end)
keymap.set("n", "<C-b>", function() require("harpoon.ui").nav_file(4) end)

-- Vim REST Console
keymap.set("n", "<leader>xr", ":call VrcQuery()<CR>") -- Run REST query

-- LSP
keymap.set('n', '<leader>gg', '<cmd>lua vim.lsp.buf.hover()<CR>')
keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
keymap.set('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
keymap.set('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>')
keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
keymap.set('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>')
keymap.set('n', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
keymap.set('v', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
keymap.set('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
keymap.set('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
keymap.set('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
keymap.set('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>')
keymap.set('n', '<leader>tr', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
keymap.set('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>')

-- Filetype-specific keymaps (these can be done in the ftplugin directory instead if you prefer)
keymap.set("n", '<leader>go', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').organize_imports();
  end
end)

keymap.set("n", '<leader>gu', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').update_projects_config();
  end
end)

keymap.set("n", '<leader>tc', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').test_class();
  end
end)

keymap.set("n", '<leader>tm', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').test_nearest_method();
  end
end)


-- Debugging
keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
keymap.set("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
keymap.set("n", '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>")
keymap.set("n", '<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>')
keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>")
keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
keymap.set("n", '<leader>dd', function() require('dap').disconnect(); require('dapui').close(); end)
keymap.set("n", '<leadeh>dt', function() require('dap').terminate(); require('dapui').close(); end)
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
keymap.set("n", '<leader>di', function() require "dap.ui.widgets".hover() end)
keymap.set("n", '<leader>d?', function() local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes) end)
keymap.set("n", '<leader>df', '<cmd>Telescope dap frames<cr>')
keymap.set("n", '<leader>dh', '<cmd>Telescope dap commands<cr>')
keymap.set("n", '<leader>de', function() require('telescope.builtin').diagnostics({default_text=":E:"}) end)

-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -

keymap.set('n', 'zy', '"*y', { desc = 'text: yank to clipboard' })
keymap.set('n', 'zu', '"*p', { desc = 'text: paste after from clipboard' })
keymap.set('n', 'zU', '"*P', { desc = 'text: paste before from clipboard' })
keymap.set('n', 'zj', '0v', { desc = 'text: start of line -> visual mode' })
keymap.set('n', 'zk', '0v$h', { desc = 'text: select line without CR char' })
keymap.set('n', 'zl', '$h', { desc = 'text: end of line without CR char' })
keymap.set('n', 'zi', 'i <ESC>', { desc = 'text: put space before' })
keymap.set('n', 'za', 'a <ESC>', { desc = 'text: put space after' })
keymap.set('n', 'zo', 'o<ESC>', { desc = 'text: put line before' })
keymap.set('n', 'zO', 'O<ESC>', { desc = 'text: put line after' })
keymap.set('n', '<C-[>', '{', { desc = 'text: jump to previous paragraph' })
keymap.set('n', '<C-]>', '}', { desc = 'text: jump to next paragraph' })

keymap.set('n', '<leader>ij', 'viW', { desc = 'text: select within non-delimited word' })
keymap.set('n', '<leader>aj', 'vaW', { desc = 'text: select within non-delimited word' })
keymap.set('n', '<leader>ik', 'viw', { desc = 'text: select within delimited word' })
keymap.set('n', '<leader>ak', 'vaw', { desc = 'text: select around delimited word' })
keymap.set('n', '<leader>il', 'vip', { desc = 'text: select within delimited paragraph' })
keymap.set('n', '<leader>al', 'vap', { desc = 'text: select around delimited paragraph' })
keymap.set('n', '<leader>jk', '?[{[(]<CR><ESC>v%', { desc = 'text: select current or previous enclosing' })
keymap.set('n', '<leader>jj', '/[{[(]<CR><ESC>v%', { desc = 'text: select next enclosing' })

keymap.set('n', '<leader>ia', 'vi\'', { desc = 'text: select within \'' })
keymap.set('n', '<leader>aa', 'va\'', { desc = 'text: select around \'' })
keymap.set('v', '<leader>ja', 'c\'\'<ESC>P', { desc = 'text: put \'\' around single line selection' })
keymap.set('v', '<leader>ka', 'I\'<ESC>gv$<ESC>a\'<ESC>', { desc = 'text: put \'\' around multi line selection' })

keymap.set('n', '<leader>is', 'vi"', { desc = 'text: select within "' })
keymap.set('n', '<leader>as', 'va"', { desc = 'text: select around "' })
keymap.set('v', '<leader>js', 'c""<ESC>P', { desc = 'text: put "" around single line selection' })
keymap.set('v', '<leader>ks', 'I"<ESC>gv$<ESC>a"<ESC>', { desc = 'text: put "" around multi line selection' })

keymap.set('n', '<leader>id', 'vi(', { desc = 'text: select within ()' })
keymap.set('n', '<leader>ad', 'va(', { desc = 'text: select around ()' })
keymap.set('v', '<leader>jd', 'c()<ESC>P', { desc = 'text: put () around single line selection' })
keymap.set('v', '<leader>kd', 'I(<ESC>gv$<ESC>a)<ESC>', { desc = 'text: put () around multi line selection' })

keymap.set('n', '<leader>if', 'vi{', { desc = 'text: select within {}' })
keymap.set('n', '<leader>af', 'va{', { desc = 'text: select around {}' })
keymap.set('v', '<leader>jf', 'c{}<ESC>P', { desc = 'text: put {} around single line selection' })
keymap.set('v', '<leader>kf', 'I{<ESC>gv$<ESC>a}<ESC>', { desc = 'text: put {} around multi line selection' })

keymap.set('n', '<leader>ig', 'vi[', { desc = 'text: select within []' })
keymap.set('n', '<leader>ag', 'va[', { desc = 'text: select around []' })
keymap.set('v', '<leader>jg', 'c[]<ESC>P', { desc = 'text: put [] around single line selection' })
keymap.set('v', '<leader>kg', 'I[<ESC>gv$<ESC>a]<ESC>', { desc = 'text: put [] around multi line selection' })

keymap.set('n', '<leader>ih', 'vi<', { desc = 'text: select within <>' })
keymap.set('n', '<leader>ah', 'va<', { desc = 'text: select around <>' })
keymap.set('v', '<leader>jh', 'c<><ESC>P', { desc = 'text: put <> around single line selection' })
keymap.set('v', '<leader>kh', 'I<<ESC>gv$<ESC>a><ESC>', { desc = 'text: put <> around multi line selection' })

-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
--
keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Undotree: toggle' })
keymap.set('n', '<leader>zs', vim.cmd.Git, { desc = 'Git: toggle' })

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'text: move selection down 1 line' })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'text: move selection up 1 line' })
keymap.set("n", "J", "mzJ`z", { desc = 'Git: toggle' })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Git: toggle' })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Git: toggle' })
keymap.set("n", "n", "nzzzv", { desc = 'Git: toggle' })
keymap.set("n", "N", "Nzzzv", { desc = 'Git: toggle' })
