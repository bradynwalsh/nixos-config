{ pkgs, ... }:

{
  services.kanshi = {
    enable = true;

    # Start daemon when Hyprland starts
    systemdTarget = "hyprland-session.target";

    # Set status of monitors for each configuration
    profiles = {
      undocked = {
        outputs = [
          {
            criteria = "eDP-1";
            scale = 1.0;
            status = "enable";
          }
        ];
      };

      home_office_docked = {
        outputs = [
          {
            criteria = "eDP-1";
            status = "disable";
          }
          {
            criteria = "LG Electronics W2353 0x01010101";
            status = "enable";
            position = "0,0";
            mode = "1920x1080@60Hz";
          }
          {
            criteria = "Samsung Electric Company C27F591 HTHH801227";
            status = "enable";
            position = "1920,0";
            mode = "1920x1080@60Hz";
          }
        ];
      };
    };
  };
}
