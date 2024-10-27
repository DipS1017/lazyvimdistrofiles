
-- Return the conform plugin for LazyVim's plugin management
return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  opts = function()
    return {
      default_format_opts = {
        timeout_ms = 3000,
        async = false,
      },
      formatters_by_ft = {
        lua = { "stylua" },        -- Lua formatter
        sh = { "shfmt" },          -- Shell formatter
        js = { "prettier" },       -- JavaScript formatter
        ts = { "prettier" },       -- TypeScript formatter
        py = { "black" },          -- Python formatter
        csharp = { "dotnet" },     -- C# formatter (using dotnet formatter)
        java = { "google-java-format" }, -- Java formatter
      },
      formatters = {
        injected = { options = { ignore_errors = true } },
      },
    }
  end,
  keys = {
    {
      "<leader>gf", 
      function()
        require("conform").format() -- Format using conform
      end,
      desc = "Format with Conform",
    },
  },
}

