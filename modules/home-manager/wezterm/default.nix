{ ... }: {
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require "wezterm"
      local act = wezterm.action

      local config = {}
      if wezterm.config_builder then
        config = wezterm.config_builder()
      end

      config.color_scheme = 'Black Metal (base16)'
      config.font_size = 14.0

      config.keys = {
        {
          key = 'k',
          mods = 'SUPER',
          action = act.Multiple {
            act.ClearScrollback 'ScrollbackAndViewport',
            act.SendKey { key = 'L', mods = 'CTRL' },
          },
        },
      }
      return config
    '';
  };
}
