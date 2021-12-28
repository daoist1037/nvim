vim.cmd "packadd packer.nvim"

local present, packer = pcall(require, "packer")

if not present then
   local packer_path = vim.fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"

   print "Cloning packer.."
   -- remove the dir before cloning
   vim.fn.delete(packer_path, "rf")
   vim.fn.system {
      "git",
      "clone",
      "https://github.com/wbthomason/packer.nvim",
      "--depth",
      "20",
      packer_path,
   }

   vim.cmd "packadd packer.nvim"
   present, packer = pcall(require, "packer")

   if present then
      print "Packer cloned successfully."
   else
      error("Couldn't clone packer !\nPacker path: " .. packer_path)
   end
end

packer.init {
   display = {
      open_fn = function()
         return require("packer.util").float { border = "single" }
      end,
      prompt_border = "single",
   },
   git = {
      clone_timeout = 600, -- Timeout, in seconds, for git clones
   },
   auto_clean = true,
}

local use = packer.use
return packer.startup(function()
    -------------------------------------
    ------------ Packer -----------------
    -------------------------------------
    use {
        "wbthomason/packer.nvim",
        event = "VimEnter",
    }
    -------------------------------------
    -------------- UI -------------------
    -------------------------------------
    use {
        'norcalli/nvim-colorizer.lua',
        ft = { 'css', 'javascript', 'vim', 'html' },
        config = [[require('colorizer').setup {'css', 'javascript', 'vim', 'html'}]],
        -- event = 'BufRead',
    }
    use {
        'navarasu/onedark.nvim',
        config = function()
            vim.g.onedark_style = 'cool'
            vim.g.onedark_toggle_style_keymap = '<nop>'
            -- vim.g.onedark_transparent_background = true
            require('onedark').setup()
        end,
    }
    use { 'kyazdani42/nvim-web-devicons' ,}
    use {
        'goolord/alpha-nvim',
        config = require('daoist1037.plugins_config.alpha'),
        -- config = function ()
            -- require'alpha'.setup(require'alpha.themes.startify'.opts)
            -- require'alpha'.setup(require'alpha.themes.dashboard'.opts)
        -- end
    }
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = require('daoist1037.plugins_config.lualine'),
    }
    use {
        'akinsho/bufferline.nvim',
        config = require('daoist1037.plugins_config.bufferline'),
        -- event = 'BufRead',
        -- event = 'User ActuallyEditing',
    }
    use {
        'yamatsum/nvim-cursorline',
        event={ 'BufReadPre', 'BufNewFile'},
    }
    use {
        'glepnir/indent-guides.nvim',
        config = require('daoist1037.plugins_config.indent-guides'),
        --[[ opt = true,
        after = 'nvim-treesitter', ]]
        -- event = 'BufRead',
    }
    -------------------------------------
    -------------- LSP ------------------
    -------------------------------------
    use {
        'neovim/nvim-lspconfig',
        config = require('daoist1037.plugins_config.nvim-lspconfig'),
        -- opt = true,
        event = {'BufReadPre', 'BufNewFile'},
        -- event = 'BufRead',
    } 
    use {
        'tami5/lspsaga.nvim',
        config = require('daoist1037.plugins_config.lspsaga'),
        -- opt = true,
        -- after = 'nvim-lspconfig',
        cmd = 'Lspsaga',
    }
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            {'L3MON4D3/LuaSnip', after = 'nvim-cmp'},
            {"hrsh7th/cmp-nvim-lsp", after = 'nvim-cmp'},
            { "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" },
            { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
            {"onsails/lspkind-nvim"},
            {"hrsh7th/cmp-buffer", after = 'nvim-cmp'},
            {"hrsh7th/cmp-nvim-lua", after = 'nvim-cmp'},
            {"hrsh7th/cmp-path", after = 'nvim-cmp'},
            {"octaltree/cmp-look", after = 'nvim-cmp'},
            {"f3fora/cmp-spell", after = 'nvim-cmp'},
            { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
        },
        config = require('daoist1037.plugins_config.nvim-cmp'),
        event = 'InsertEnter *',
    }  
    use {
        'williamboman/nvim-lsp-installer',
        opt = true,
        after = 'nvim-lspconfig',
    }
    use {
        "ray-x/lsp_signature.nvim",
        opt = true,
        after = 'nvim-lspconfig',
        -- disable = true,
    }
    use {
        'nathom/filetype.nvim',
        config = function()
            require('filetype').setup({
                overrides = {}
            })
        end
    }
    -------------------------------------
    ------------- Tools -----------------
    -------------------------------------
    -- use { "nvim-lua/popup.nvim" }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = require('daoist1037.plugins_config.nvim-tree'),
        cmd = {'NvimTreeToggle',  'NvimFocus'},
    }
    --[[ use {
        "nvim-lua/plenary.nvim",
        opt = false,
    } ]]
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 
            {'nvim-lua/plenary.nvim', opt = false,},
            {'nvim-lua/popup.nvim', opt = true,}
        },
        config = require('daoist1037.plugins_config.telescope'),
        cmd = 'Telescope',
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        -- config = require('daoist1037.plugins_config.nvim-treesitter'),
        opt = true,
        run = 'TSUpdate',
        event = 'BufRead',
    }
    use {
        "nvim-treesitter/playground",
        opt = true,
        after = 'nvim-treesitter',
        -- requires = "nvim-treesitter",
    }
    use {
        "nvim-treesitter/completion-treesitter",
        opt = true,
        after = 'nvim-treesitter',
        -- requires = "nvim-treesitter",
    }
    use {
        "nvim-treesitter/nvim-treesitter-refactor",
        opt = true,
        after = 'nvim-treesitter',
        -- requires = "nvim-treesitter",
    }
    use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        opt = true,
        after = 'nvim-treesitter',
        -- requires = "nvim-treesitter",
    }
    use {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        opt = true,
    }
    -------------------------------------
    --------------- Keys ----------------
    -------------------------------------
    use {
        "folke/which-key.nvim",
        config = require('daoist1037.plugins_config.which-key'),
        event = 'VimEnter',
    }
    use {
        'phaazon/hop.nvim',
        -- as = 'hop',
        config = function()
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
            -- vim.api.nvim_set_keymap('n', '<leader><leader>w', "<cmd>lua require'hop'.hint_words()<cr>", {})
        end,
        cmd = {
            'HopLine', 'HopLineStart', 'HopWord','HopPattern', 'HopChar1', 'HopChar2',
        }
    }
    -- 'tabout' is incompatible with 'nvim-autopairs'

    -------------------------------------
    --------------- Edit ----------------
    -------------------------------------
    use {
        'machakann/vim-highlightedyank',
        event = 'TextYankPost *',
    }
    use {
        'windwp/nvim-autopairs',
        config = require('daoist1037.plugins_config.nvim-autopairs'),
        -- after = 'nvim-cmp',
        event = 'InsertEnter *',
    }
    use {
        'b3nj5m1n/kommentary',
    }  
    use {
        "blackCauldron7/surround.nvim",
        config = function()
            require("surround").setup { mappings_style = "sandwich" }
        end,
        event = 'BufRead',
        --- add: sa{motion/textobject}{delimiter}
        --- delete: sd{delimiter}
        --- replace: sr{old}{new}
        --- ss repeats last surround command.
    }

end)
