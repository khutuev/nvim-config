return {
  "coffebar/neovim-project",
  opts = {
    projects = {
      "~/sigma/*/*",
    },

    -- Path to store history and sessions
    datapath = vim.fn.stdpath("data"), -- ~/.local/share/nvim/
    -- Load the most recent session on startup if not in the project directory
    last_session_on_startup = true,
    -- Dashboard mode prevent session autoload on startup
    dashboard_mode = false,

    -- Overwrite some of Session Manager options
    session_manager_opts = {
      autosave_ignore_dirs = {
        vim.fn.expand("~"), -- don't create a session for $HOME/
        "/tmp",
      },
      autosave_ignore_filetypes = {
        -- All buffers of these file types will be closed before the session is saved
        "ccc-ui",
        "gitcommit",
        "gitrebase",
        "qf",
        "toggleterm",
      },
    },
  },
  init = function()
    vim.opt.sessionoptions:append("globals")
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
    { "Shatur/neovim-session-manager" },
  },
  lazy = false,
  priority = 100,
}
