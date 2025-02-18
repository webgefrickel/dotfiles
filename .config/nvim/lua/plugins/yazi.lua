-- Those plugins are for the file-manager of choice: yazi
-- (and except for the first one are yazi-plugins themselves)

return {
  { 'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    opts = {
      open_for_directories = true,
      yazi_floating_window_border = 'none',
    },
  },
  { 'Rolv-Apneseth/starship.yazi',
    lazy = true,
    build = function(plugin)
      require('yazi.plugin').build_plugin(plugin)
    end,
  },
  { 'Ape/smart-enter.yazi',
    lazy = true,
    build = function(plugin)
      require('yazi.plugin').build_plugin(plugin)
    end,
  },
  { 'KKV9/bat.yazi',
    lazy = true,
    build = function(plugin)
      require('yazi.plugin').build_plugin(plugin)
    end,
  },
  { 'imsi32/yatline.yazi',
    lazy = true,
    build = function(plugin)
      require('yazi.plugin').build_plugin(plugin)
    end,
  },
}
