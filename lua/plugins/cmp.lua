return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "Exafunction/codeium.nvim",
    "windwp/nvim-autopairs",
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local cmp_autopairs = require "nvim-autopairs.completion.cmp"

    cmp.setup({
      debug = true,
      window = {
        completion = {
          border = "rounded",
        },
        documentation = {
          border = "rounded",
        },
      },
      formatting = {
        format = function(entry, vim_item)
          local KIND_ICONS = {
            Tailwind = '󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞',
            Color = ' ',
            -- Class = 7,
            -- Constant = '󰚞',
            -- Constructor = 4,
            -- Enum = 13,
            -- EnumMember = 20,
            -- Event = 23,
            -- Field = 5,
            -- File = 17,
            -- Folder = 19,
            -- Function = 3,
            -- Interface = 8,
            -- Keyword = 14,
            -- Method = 2,
            -- Module = 9,
            -- Operator = 24,
            -- Property = 10,
            -- Reference = 18,
            Snippet = " ",
            -- Struct = 22,
            -- Text = "",
            -- TypeParameter = 25,
            -- Unit = 11,
            -- Value = 12,
            -- Variable = 6
          }

          if vim_item.kind == 'Color' and entry.completion_item.documentation then
            local _, _, r, g, b = string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')

            if r and g and b then
              local color = string.format('%02x', r) .. string.format('%02x', g) .. string.format('%02x', b)
              local group = 'Tw_' .. color

              if vim.api.nvim_call_function('hlID', { group }) < 1 then
                vim.api.nvim_command('highlight' .. ' ' .. group .. ' ' .. 'guifg=#' .. color)
              end

              vim_item.kind = KIND_ICONS.Tailwind
              vim_item.kind_hl_group = group
              return vim_item
            end
          end

          vim_item.kind = KIND_ICONS[vim_item.kind] or vim_item.kind
          return vim_item
        end,
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-n>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            cmp.mapping.complete()(fallback)
          end
        end, { "i", "s" }),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-y>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      },
      sources = { -- the sorces are in order of priority
        { name = 'codeium' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'luasnip' },
      },

      experimental = {
        ghost_text = { hlgroup = "Comment" },
      },
    })

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'git' },
      }, {
        { name = 'buffer' },
      })
    })

    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })
  end,
}
