{
  services.hypridle = {
    enable=true;
    settings = {
      listener = [
        {
          timeout = 900;
          on-timeout = "pidof hyprlock || hyprlock";
        }
        {
          timeout = 60;
          on-timeout = "pidof hyprlock && hyprctl dispatch dpms off"; 
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 3200;
          on-timeout = "pidof hyprlock && systemctl suspend";
        }
      ];
    };
  };
}