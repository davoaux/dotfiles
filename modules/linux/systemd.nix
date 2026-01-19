{ pkgs, ... }:

{
  systemd.user.services.usb-listener = {
    Unit = {
      Description = "USB Device Listener Service";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
    Service = {
      Type = "simple";
      Restart = "always";
      RestartSec = 5;
      ExecStart = "${pkgs.writeShellScript "usb-listener" ''
        pathtoname() {
          udevadm info -p /sys/"$1" | awk -v FS== '/DEVNAME/ {print $2}'
        }

        stdbuf -oL -- udevadm monitor --udev -s block | while read -r -- _ _ event devpath _; do
          if [[ "$event" = add ]]; then
            devname=$(pathtoname "$devpath")
            udisksctl mount --block-device "$devname" --no-user-interaction
            notify-send "USB Device connected" "Mounted $devname somewhere, perhaps /run/media/$USER/usbdrive" --expire-time=5000
          elif [[ "$event" = remove ]]; then
            notify-send "USB Device disconnected" "Device removed" --expire-time=5000
          fi
        done
      ''}";
    };
  };
}
