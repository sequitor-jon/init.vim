vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- moves block of text in visual mode with J and K:
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Neomake
vim.keymap.set("n", "<leader>m", ":Neomake!<CR>")

-- Quick current-word-under-cursor highlighting toggle
vim.keymap.set("n", " ", "", {
  callback = function()
    local current_word = vim.call('expand','<cword>')

    if vim.o.hlsearch then
      -- if new word, we should clear and highlight again
      local pattern = '^\\<' .. current_word .. '\\>$'
      if string.match(vim.fn.getreg('/'), pattern) then
        -- not a new word, just turn highlighting off
        vim.o.hlsearch = false
        return
      end
    end

    vim.fn.setreg('/', '\\<' .. current_word .. '\\>')
    vim.o.hlsearch = true
  end,
  noremap = true,
  silent = true,
  desc = "Toggle highlighting of current word under cursor",
})
