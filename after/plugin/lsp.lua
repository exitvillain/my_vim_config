local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)


lsp.setup()

-- The following line is required to setup the language server for python!
require('lspconfig').pyright.setup({
    cmd = { "/home/neo/.npm-global/bin/pyright-langserver", "--stdio" }
})

require('lspconfig').tsserver.setup({
    cmd = { "typescript-language-server", "--stdio" },
    on_attach = function(client)
        -- Disable tsserver formatting if you plan to use null-ls
        client.resolved_capabilities.document_formatting = false
        lsp.on_attach(client)  -- Use the `on_attach` function defined earlier
    end,
    handlers = {
        -- Disable tsserver error reporting as diagnostics are provided by eslint
        ["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = true,
            }
        )
    }
})

require('lspconfig').html.setup({
    cmd = {"/home/neo/.nvm/versions/node/v20.3.0/lib/node_modules/vscode-langservers-extracted/bin/vscode-html-language-server", "--stdio"};
    filetypes = {"html", "htmldjango"}
})



require('lspconfig').cssls.setup({
    cmd = {"/home/neo/.nvm/versions/node/v20.3.0/lib/node_modules/vscode-langservers-extracted/bin/vscode-css-language-server", "--stdio"}
})
