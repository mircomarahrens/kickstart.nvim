-- https://github.com/nvim-telescope/telescope.nvim
-- file browser
return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
        local filebrowser = require("telescope").extensions.file_browser
        vim.keymap.set("n", "<leader>fb", filebrowser.file_browser, { noremap = true })
        vim.api.nvim_set_keymap("n", "<leader><leader>", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })
    end
}
