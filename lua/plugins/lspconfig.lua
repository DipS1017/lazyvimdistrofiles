return {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    diagnostics={
      underline=true,
        update_in_insert = true,
        virtual_text ={enabled=false},
        
    },
}
}
