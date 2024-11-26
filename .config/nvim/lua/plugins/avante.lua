return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  opts = {
    ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
    provider = "local-qwen", -- Initial provider
    -- Since auto-suggestions are a high-frequency operation and therefore expensive,
    -- it is recommended to specify an inexpensive provider or even a free provider: copilot
    auto_suggestions_provider = "local-qwen",
    vendors = {
      ---@type AvanteProvider
      ["local-qwen"] = {
        ["local"] = true,
        endpoint = "http://" .. os.getenv("WINDOWS_LOCALHOST") .. ":1235/v1",
        model = "qwen2.5-coder-14b-instruct",
        api_key_name = "",
        timeout = 30000,
        temperature = 0.7,
        max_tokens = -1,
        ---@type fun(opts: AvanteProvider, code_opts: AvantePromptOptions): AvanteCurlOutput
        parse_curl_args = function(opts, code_opts)
          return {
            url = opts.endpoint .. "/chat/completions",
            headers = {
              ["Accept"] = "application/json",
              ["Content-Type"] = "application/json",
            },
            body = {
              model = opts.model,
              messages = require("avante.providers").openai.parse_messages(code_opts),
              max_tokens = opts.max_tokens,
              temperature = opts.temperature,
              stream = true,
            },
          }
        end,
        ---@type fun(data_stream: string, event_state: string, opts: ResponseParser): nil
        parse_response_data = function(data_stream, event_state, opts)
          require("avante.providers").openai.parse_response(data_stream, event_state, opts)
        end,
      },
      ["grok"] = {
        endpoint = "https://api.x.ai/v1",
        model = "grok-beta",
        api_key_name = "XAI_API_KEY",
        timeout = 30000, -- Timeout in milliseconds
        temperature = 0,
        max_tokens = 4096,
        ["local"] = false,
        ---@type fun(opts: AvanteProvider, code_opts: AvantePromptOptions): AvanteCurlOutput
        parse_curl_args = function(opts, code_opts)
          local base, body_opts = require("avante.providers").parse_config(opts)
          return {
            url = base.endpoint .. "/chat/completions",
            proxy = base.proxy,
            insecure = base.allow_insecure,
            headers = {
              ["Content-Type"] = "application/json",
              ["Authorization"] = "Bearer " .. os.getenv(opts.api_key_name),
            },
            body = vim.tbl_deep_extend("force", {
              model = base.model,
              messages = require("avante.providers").openai.parse_messages(code_opts),
              stream = true,
            }, body_opts),
          }
        end,
        ---@type fun(data_stream: string, event_state: string, opts: ResponseParser): nil
        parse_response = function(data_stream, event_state, opts)
          require("avante.providers").openai.parse_response(data_stream, event_state, opts)
        end,
      },
    },
    behaviour = {
      auto_suggestions = false, -- Experimental stage
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
    },
    mappings = {
      --- @class AvanteConflictMappings
      diff = {
        ours = "co",
        theirs = "ct",
        all_theirs = "ca",
        both = "cb",
        cursor = "cc",
        next = "]x",
        prev = "[x",
      },
      suggestion = {
        accept = "<M-l>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
      submit = {
        normal = "<CR>",
        insert = "<C-s>",
      },
      sidebar = {
        apply_all = "A",
        apply_cursor = "a",
        switch_windows = "<Tab>",
        reverse_switch_windows = "<S-Tab>",
      },
      edit = "<C-k>",
      -- Keymaps for provider swapping
      provider_swap = {
        local_qwen = "<leader>a1",
        grok = "<leader>a2",
        claude = "<leader>a3",
      },
    },
    hints = { enabled = true },
    windows = {
      ---@type "right" | "left" | "top" | "bottom"
      position = "right", -- the position of the sidebar
      wrap = true, -- similar to vim.o.wrap
      width = 30, -- default % based on available width
      sidebar_header = {
        enabled = true, -- true, false to enable/disable the header
        align = "center", -- left, center, right for title
        rounded = true,
      },
      input = {
        prefix = "> ",
        height = 8, -- Height of the input window in vertical layout
      },
      edit = {
        border = "rounded",
        start_insert = true, -- Start insert mode when opening the edit window
      },
      ask = {
        floating = false, -- Open the 'AvanteAsk' prompt in a floating window
        start_insert = true, -- Start insert mode when opening the ask window
        border = "rounded",
        ---@type "ours" | "theirs"
        focus_on_apply = "ours", -- which diff to focus after applying
      },
    },
    highlights = {
      ---@type AvanteConflictHighlights
      diff = {
        current = "DiffText",
        incoming = "DiffAdd",
      },
    },
    --- @class AvanteConflictUserConfig
    diff = {
      autojump = true,
      ---@type string | fun(): any
      list_opener = "copen",
      --- Override the 'timeoutlen' setting while hovering over a diff (see :help timeoutlen).
      --- Helps to avoid entering operator-pending mode with diff mappings starting with `c`.
      --- Disable by setting to -1.
      override_timeoutlen = 500,
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  config = function(_, opts)
    local avante = require("avante")
    avante.setup(opts)

    -- Function to swap providers
    local function swap_provider(new_provider)
      opts.provider = new_provider
      avante.setup(opts)
      vim.notify("Switched to " .. new_provider, vim.log.levels.INFO)
    end

    -- Set up keymaps for provider swapping
    vim.keymap.set("n", opts.mappings.provider_swap.local_qwen, function()
      swap_provider("local-qwen")
    end, { desc = "Switch to Local Qwen" })

    vim.keymap.set("n", opts.mappings.provider_swap.grok, function()
      swap_provider("grok")
    end, { desc = "Switch to Grok" })

    vim.keymap.set("n", opts.mappings.provider_swap.claude, function()
      swap_provider("claude")
    end, { desc = "Switch to Claude" })
  end,
}
