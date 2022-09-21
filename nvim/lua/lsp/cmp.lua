local cmp = require("cmp")

cmp.setup({
    -- TODO preselect
    -- preselect = cmp.PreselectMode.Item,
    snippet = {
        expand = function(args)
            -- use vsnip
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },

    -- 补全源
    sources = cmp.config.sources( {
        { name = "vsnip"   },
        { name = "nvim_lsp"},
    }, {
        { name = "buffer"  },
        { name = "path"    }
    }
    ),

    -- keybindings
    mapping = require("keybindings").cmp(cmp),

})

-- Use buffer source for `/` 
-- (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
    --mapping = require("keybindings").cmp(cmp),
    sources = {
        { name = "buffer" },
    },
})

-- Use cmdline & path source for ':' 
---- (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
    sources = cmp.config.sources({
        { name = "path"    },
    },{
        -- TODO bug typing ':!' cause stuck
        -- https://github.com/hrsh7th/nvim-cmp/issues/821
        -- https://github.com/hrsh7th/cmp-cmdline/issues/24
        -- Do not show completion for words starting with '!'
        { name = "cmdline", keyword_pattern = [[\!\@<!\w*]]},

    }),
})
