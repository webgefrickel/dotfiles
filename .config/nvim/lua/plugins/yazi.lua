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
  { 'yazi-rs/plugins',
    name = 'yazi-rs-plugins',
    lazy = true,
    build = function(plugin)
      require('yazi.plugin').build_plugin(plugin, { sub_dir = 'full-border.yazi' })
      require('yazi.plugin').build_plugin(plugin, { sub_dir = 'piper.yazi' })
      require('yazi.plugin').build_plugin(plugin, { sub_dir = 'smart-enter.yazi' })
    end,
  },
  { 'Rolv-Apneseth/starship.yazi',
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
