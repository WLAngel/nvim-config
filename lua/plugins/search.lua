return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>ff", false },
      { "<leader>fg", false },
      { "<leader>ff", function() Snacks.picker.git_files() end, desc = "Find Files (git-files)" },
      { "<leader>ft", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
    },
  },
  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end,
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    cmd = { "Files", "GFiles", "Buffers", "Rg", "RG" },
    config = function()
      vim.cmd([[
        command! -bang -nargs=* Rg
          \ call fzf#vim#grep(
          \ "rg --column --line-number --no-heading --color=always --smart-case --hidden --glob=!.git/ -- ".fzf#shellescape(<q-args>),
          \ fzf#vim#with_preview(),
          \ <bang>0
          \ )
      ]])

      vim.cmd([[
        command! -bang -nargs=* RG
          \ call fzf#vim#grep2(
          \ "rg --column --line-number --no-heading --color=always --smart-case --hidden --glob=!.git/ -- ",
          \ <q-args>,
          \ fzf#vim#with_preview(),
          \ <bang>0
          \ )
      ]])
    end,
  },
}
