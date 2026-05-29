{ config, pkgs, ... }:

{
  
  # Printing
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cups-filters
      cups-browsed
      cnijfilter2 # Canon Pixma drivers
    ];
  };
  hardware.printers.ensurePrinters = [
    {
      name = "Canon_TS3300_series";
      location = "";
      deviceUri = "usb://Canon/TS3300%20series?serial=4C3AAE&interface=1";
      model = "canone3300.ppd";
    }
  ];

  # Scanners
  hardware.sane.enable = true;
}