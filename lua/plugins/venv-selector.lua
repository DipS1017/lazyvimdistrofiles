return {
  'linux-cultist/venv-selector.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',            -- Required for LSP configuration
    'nvim-telescope/telescope.nvim',    -- Required for fuzzy finding
    'mfussenegger/nvim-dap-python'     -- Required for Python debugging
  },
  opts = {
    settings = {
      options = {
        -- Enable notifications when venv is activated
        notify_user_on_venv_activation = true,

        -- Configure the names of the virtual environment directories to search
        venv_directories = { ".venv", "venv", "env", "virtualenv" },

        -- Parental search configuration:
        -- Go up 3 parent directories and search downwards for venv directories
        parents = 3,
        name = { ".venv", "venv", "virtualenv" },

        -- Poetry, Pipenv, and PDM manager search configuration:
        poetry_path = "~/path/to/poetry/virtualenvs", -- Modify this to the actual Poetry path
        pipenv_path = "~/.local/share/virtualenvs",   -- Modify this to your Pipenv path
        pdm_path = "~/.local/share/pdm/virtualenvs",  -- Modify this to your PDM path

        -- Optional: If you want to use Anaconda environments, you can specify the path here:
        anaconda_path = "~/anaconda3/envs",           -- Modify this to your Anaconda environments path
      },
    },
  },
  event = 'VeryLazy',  -- Delay loading of the plugin for performance (only load when needed)
  keys = {
    -- Keybinding to select a virtual environment
    { '<leader>vs', '<cmd>VenvSelect<cr>', desc = 'Select VirtualEnv' },
    -- Keybinding to load the cached virtual environment for the current project directory
    { '<leader>vc', '<cmd>VenvSelectCached<cr>', desc = 'Select Cached VirtualEnv' },
  },
  ft = "python",  -- Enable this plugin for Python files only
  config = function()
    -- Optionally set the pythonPath for LSP if a virtual environment is found
    local function set_python_path()
      local cwd = vim.fn.getcwd()  -- Get the current working directory
      for _, venv_name in ipairs({".venv", "venv", "env", "virtualenv"}) do
        local venv_path = cwd .. "/" .. venv_name .. "/bin/python"
        if vim.fn.executable(venv_path) == 1 then
          -- Set the pythonPath in the LSP configuration
          require('lspconfig').pyright.setup({
            settings = {
              python = {
                pythonPath = venv_path
              }
            }
          })
          return venv_path
        end
      end
      -- Fallback to system Python if no virtualenv is found
      return "/usr/bin/python"
    end
    
    -- Call the function to set the Python path for the current workspace
    set_python_path()
  end,
}
