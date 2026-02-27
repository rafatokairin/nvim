return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      vim.lsp.config("clangd", {
        cmd = { "clangd", "--background-index", "--clang-tidy" },
        init_options = {
          clangdFileStatus = true,
          fallbackFlags = { "--std=c++98" },
        },
      })

      vim.lsp.enable({ "lua_ls", "clangd" })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local buf = args.buf
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buf })
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buf })
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = buf })
        end,
      })
    end,
  },
}
