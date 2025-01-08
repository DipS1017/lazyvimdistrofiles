
return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  opts = function()
    return {
      default_format_opts = {
        timeout_ms = 5000, -- Adjusted timeout
        async = false,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        python = { "black" },
        cs = { "dotnet" },
        java = { "google-java-format" },
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
        require("conform").format()
      end,
      desc = "Format with Conform",
    },
    {
      "<leader>gs",
      function()
        require("conform").format()
        vim.cmd("write")
      end,
      desc = "Format and Save",
    },
  },
}


