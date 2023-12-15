{ conifg, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland.enable = true;

  wayland.windowManager.hyprland.settings = {
    "$terminal" = "kitty";
    "$menu" = "wofi --show drun";

    env = "XCURSOR_SIZE,24";

    "$mod" = "SUPER";

    bind = [
      "$mod, Q, exec, $terminal"
      "$mod, C, killactive"
      "$mod, M, exit"
      "$mod, V, togglefloating"
      "$mod, R, exec, $menu"
      "$mod, P, pseudo"
      "$mod, J, togglesplit"
    ] ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      ) ++ [
        "$mod, S, togglespecialworkspace, magic"
        "$mod SHIFT, S, movetoworkspace, special:magic"
      ];

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
  };
}
