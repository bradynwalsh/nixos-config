{ pkgs, ... }:

{
  services.kanshi = {
    enable = true;

    # Start daemon when Hyprland starts
    systemdTarget = "hyprland-session.target";

    # Set status of monitors for each configuration
    settings = [
      {
        profile.name = "undocked";
        profile.outputs = [{
          criteria = "eDP-1";
          scale = 1.0;
          status = "enable";
        }];
      }
      {
        profile.name = "home_office_docked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            status = "disable";
          }
          {
            criteria =  "LG Electronics W2353 0x01010101";
            status = "enable";
            position = "0,0";
            mode = "1920x1080@59.94Hz";
          }
          {
            criteria = "Samsung Electric Company C27F591 HTHH801227";
            status = "enable";
            position = "1920,0";
            mode = "1920x1080@59.94Hz";
          }
        ];
      }
    ];
  };
}
