local function has_words_before()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end

  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and
           vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(
             col, col
           ):match("%s") == nil
end

local function config()
  vim.g.completeopt = "menu,menuone,noselect,noinsert"

  local lspkind_status_ok, lspkind = pcall(require, "lspkind")
  if not lspkind_status_ok then
    return
  end
  lspkind.init()

  local cmp_status_ok, cmp = pcall(require, "cmp")
  if not cmp_status_ok then
    return
  end
  local luasnip_status_ok, luasnip = pcall(require, "luasnip")
  if not luasnip_status_ok then
    return
  end

  cmp.setup {
    mapping = {
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-e>"] = cmp.mapping.close(),
      ["<C-y>"] = cmp.mapping(
        cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }, { "i", "c" }
      ),

      ["<C-space>"] = cmp.mapping {
        i = cmp.mapping.complete(),
        c = function(_ --[[fallback]] )
          if cmp.visible() then
            if not cmp.confirm { select = true } then
              return
            end
          else
            cmp.complete()
          end
        end,
      },

      -- Testing
      ["<C-q>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },

      ["<A-j>"] = cmp.mapping(
        function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }
      ),

      ["<A-k>"] = cmp.mapping(
        function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }
      ),
    },

    sources = {
      -- Could enable this only for lua, but nvim_lua handles that already.
      { name = "nvim_lua" },
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "luasnip" },
      { name = "buffer", keyword_length = 5 },
      { name = "emoji" },
    },

    sorting = {
      -- TODO: Would be cool to add stuff like "See variable names before method names" in rust, or something like that.
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,

        -- copied from cmp-under, but I don't think I need the plugin for this.
        -- I might add some more of my own.
        function(entry1, entry2)
          local _, entry1_under =
            entry1.completion_item.label:find "^_+"
          local _, entry2_under =
            entry2.completion_item.label:find "^_+"
          entry1_under = entry1_under or 0
          entry2_under = entry2_under or 0
          if entry1_under > entry2_under then
            return false
          elseif entry1_under < entry2_under then
            return true
          end
        end,

        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    },

    -- come back here when luasnip is installed
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },

    formatting = {
      -- How to set up nice formatting for your sources.
      format = lspkind.cmp_format {
        with_text = true,
        menu = {
          nvim_lsp = "[LSP]",
          emoji = "[EMOJ]",
          luasnip = "[SNIP]",
          nvim_lua = "[API]",
          path = "[PATH]",
          buffer = "[BUF]",
        },
      },
    },

    experimental = {
      -- I like the new menu better! Nice work hrsh7th
      native_menu = false,

      -- Let's play with this for a day or two
      ghost_text = true,
    },

    documentation = {
      border = "rounded",
      winhighlight = "FloatBorder:FloatBorder,Normal:Normal",
    },
  }

  cmp.setup.cmdline(
    "/", {
      sources = cmp.config.sources(
        { { name = "nvim_lsp_document_symbol" } },
        { { name = "buffer" } }
      ),
    }
  )

  cmp.setup.cmdline(
    ":", {
      sources = cmp.config.sources(
        { { name = "path" } }, {
          -- increase keyword_length if it gets annoying
          { name = "cmdline", max_item_count = 30, keyword_length = 1 },
        }
      ),
    }
  )

  -- shout out to Telescopic Johnson
end

return {
  setup = function(use)
    use { "hrsh7th/nvim-cmp", config = config }

    use { "hrsh7th/cmp-path" }
    use { "hrsh7th/cmp-cmdline" }
    use { "saadparwaiz1/cmp_luasnip" }
    use { "hrsh7th/cmp-nvim-lua" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-emoji" }

    use { "onsails/lspkind-nvim" }
  end,
}
