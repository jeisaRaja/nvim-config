return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "gopls", "tailwindcss", "eslint", "clangd", "marksman" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/nvim-cmp", "L3MON4D3/LuaSnip" }, -- Ensure cmp and luasnip are installed
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      local cmp = require("cmp")
      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      -- LSP Configurations

      lspconfig.rust_analyzer.setup({
        capabilities = capabilities
      })
      lspconfig.glsl_analyzer.setup({
        capabilities = capabilities
      })
      lspconfig.marksman.setup({
        capabilities = capabilities
      })
      lspconfig.gdscript.setup({
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.clangd.setup({
        capabilities = capabilities
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities
      })
      lspconfig.gopls.setup({
        capabilities = capabilities
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities
      })
      lspconfig.pyright.setup {
        on_attach = on_attach,
        settings = {
          pyright = { autoImportCompletion = true },
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = 'openFilesOnly',
              useLibraryCodeForTypes = true,
              typeCheckingMode = 'off',
            }
          }
        }
      }
      lspconfig.eslint.setup({
        settings = {
          packageManager = 'npm'
        },
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })

      -- lspconfig.racket_langserver.setup({
      --   cmd = { "racket", "-l", "racket-langserver" },              -- Runs racket-langserver via Racket
      --   filetypes = { "racket" },                                   -- Only for Racket files
      --   root_dir = lspconfig.util.root_pattern("main.rkt", ".git"), -- Finds the project root
      --   capabilities = capabilities,
      -- })

      lspconfig.racket_langserver.setup {
        cmd = { "racket", "-l", "racket-langserver" },               -- This is the command to start the language server
        filetypes = { "racket" },                                    -- LSP should only be activated for Racket files
        root_dir = lspconfig.util.root_pattern("raco.json", ".git"), -- Root directory of the project
        capabilities = capabilities,
      }

      -- GDScript-Specific Keymap
      vim.keymap.set('n', '<leader>sg', function()
        vim.fn.serverstart '127.0.0.1:6004'
      end, { noremap = true })

      -- General LSP Keymaps
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})

      -- CMP Setup
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
        }, {
          { name = 'buffer' },
        })
      })
    end
  }
}
