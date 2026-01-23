{ pkgs, ... }: {
  home.packages = [ pkgs.aerospace ];

  home.file.".config/aerospace/aerospace.toml".text = ''
    accordion-padding = 0

    # Navigation
    [mode.main.binding]
    alt-shift-ctrl-h = 'focus left'
    alt-shift-ctrl-j = 'focus down'
    alt-shift-ctrl-k = 'focus up'
    alt-shift-ctrl-l = 'focus right'

    # Move windows
    alt-shift-ctrl-cmd-h = 'move left'
    alt-shift-ctrl-cmd-j = 'move down'
    alt-shift-ctrl-cmd-k = 'move up'
    alt-shift-ctrl-cmd-l = 'move right'

    # Workspaces
    alt-shift-ctrl-1 = 'workspace 1'
    alt-shift-ctrl-2 = 'workspace 2'
    alt-shift-ctrl-3 = 'workspace 3'
    alt-shift-ctrl-4 = 'workspace 4'
    alt-shift-ctrl-5 = 'workspace 5'
    alt-shift-ctrl-6 = 'workspace 6'
    alt-shift-ctrl-7 = 'workspace 7'
    alt-shift-ctrl-8 = 'workspace 8'
    alt-shift-ctrl-9 = 'workspace 9'

    # Move window to workspace
    alt-shift-ctrl-cmd-1 = 'move-node-to-workspace 1'
    alt-shift-ctrl-cmd-2 = 'move-node-to-workspace 2'
    alt-shift-ctrl-cmd-3 = 'move-node-to-workspace 3'
    alt-shift-ctrl-cmd-4 = 'move-node-to-workspace 4'
    alt-shift-ctrl-cmd-5 = 'move-node-to-workspace 5'
    alt-shift-ctrl-cmd-6 = 'move-node-to-workspace 6'
    alt-shift-ctrl-cmd-7 = 'move-node-to-workspace 7'
    alt-shift-ctrl-cmd-8 = 'move-node-to-workspace 8'
    alt-shift-ctrl-cmd-9 = 'move-node-to-workspace 9'

    # Layout
    alt-shift-ctrl-slash = 'layout tiles horizontal vertical'
    alt-shift-ctrl-comma = 'layout accordion horizontal vertical'

    # Resize
    alt-shift-ctrl-minus = 'resize smart -50'
    alt-shift-ctrl-equal = 'resize smart +50'

    # Misc
    alt-shift-ctrl-tab = 'workspace-back-and-forth'
    alt-shift-ctrl-cmd-tab = 'move-workspace-to-monitor --wrap-around next'
    alt-shift-ctrl-semicolon = 'mode service'

    [mode.service.binding]
    esc = ['reload-config', 'mode main']
    r = ['flatten-workspace-tree', 'mode main']
    f = ['layout floating tiling', 'mode main']
    backspace = ['close-all-windows-but-current', 'mode main']

    # App-specific rules
    [[on-window-detected]]
    if.app-id = 'com.spotify.client'
    run = 'move-node-to-workspace 9'
  '';

  launchd.agents.aerospace = {
    enable = true;
    config = {
      ProgramArguments = [ "${pkgs.aerospace}/Applications/AeroSpace.app/Contents/MacOS/AeroSpace" ];
      RunAtLoad = true;
      KeepAlive = true;
    };
  };
}
