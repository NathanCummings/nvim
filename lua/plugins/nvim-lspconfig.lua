local on_attach = require("util.lsp").on_attach
local diagnostic_signs = require("util.lsp").diagnostic_signs

local config = function()
    require("neoconf").setup({})
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local lspconfig = require("lspconfig")

    require('lspconfig.ui.windows').default_options.border = 'single'

    for type, icon in pairs(diagnostic_signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- lua
    lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = { -- custom settings for lua
            Lua = {
                -- make the language server recognize "vim" global
                diagnostics = {
                    globals = { "vim" },
                    disable = { "missing-parameters", "missing-fields" },
                },
                workspace = {
                    -- make language server aware of runtime files
                    library = {
                        vim.env.VIMRUNTIME,
                    },
                },
            },
        },
    })

    -- json
    lspconfig.jsonls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "json", "jsonc" },
    })

    -- python
    lspconfig.basedpyright.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            basedpyright = {
                disableOrganizeImports = true,
                typeCheckingMode = "standard", -- off, basic, standard, strict, all
                python = {
                    analysis = {
                        ignore = { '*' },
                    },
                },
            },
        },
        root_dir = lspconfig.util.root_pattern(".venv", "venv", "pyproject.toml")
    })

    lspconfig.ruff.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {},
    })

    -- typescript
    lspconfig.ts_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {
            "typescript",
        },
        root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
    })

    -- bash
    lspconfig.bashls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "sh" },
    })

    -- solidity
    lspconfig.solidity.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "solidity" },
    })

    -- html, typescriptreact, javascriptreact, css, sass, scss, less, svelte, vue
    lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = {
            "html",
            "typescriptreact",
            "javascriptreact",
            "javascript",
            "css",
            "sass",
            "scss",
            "less",
            "svelte",
            "vue",
        },
    })

    -- docker
    lspconfig.dockerls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })

    local luacheck = require("efmls-configs.linters.luacheck")
    local stylua = require("efmls-configs.formatters.stylua")
    local eslint_d = require("efmls-configs.linters.eslint_d")
    local prettierd = require("efmls-configs.formatters.prettier_d")
    local fixjson = require("efmls-configs.formatters.fixjson")
    local shellcheck = require("efmls-configs.linters.shellcheck")
    local shfmt = require("efmls-configs.formatters.shfmt")
    local alex = require("efmls-configs.linters.alex")
    local hadolint = require("efmls-configs.linters.hadolint")
    local solhint = require("efmls-configs.linters.solhint")

    -- configure efm server
    lspconfig.efm.setup({
        filetypes = {
            "lua",
            "python",
            "json",
            "jsonc",
            "sh",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "svelte",
            "vue",
            "markdown",
            "docker",
            "solidity",
        },
        init_options = {
            documentFormatting = true,
            documentRangeFormatting = true,
            hover = true,
            documentSymbol = true,
            codeAction = true,
            completion = true,
        },
        settings = {
            languages = {
                lua = { luacheck, stylua },
                typescript = { eslint_d, prettierd },
                json = { eslint_d, fixjson },
                jsonc = { eslint_d, fixjson },
                sh = { shellcheck, shfmt },
                javascript = { eslint_d, prettierd },
                javascriptreact = { eslint_d, prettierd },
                typescriptreact = { eslint_d, prettierd },
                svelte = { eslint_d, prettierd },
                vue = { eslint_d, prettierd },
                markdown = { alex, prettierd },
                docker = { hadolint, prettierd },
                solidity = { solhint },
            },
        },
    })
end

return {
    "neovim/nvim-lspconfig",
    config = config,
    event = "BufReadPre",
    dependencies = {
        "windwp/nvim-autopairs",
        "williamboman/mason.nvim",
        "creativenull/efmls-configs-nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
    },
}
