#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/by-name/recovery$(getprop ro.boot.slot_suffix):100663296:c5b3670afcf54511a2523560ae75d1758c2d35be; then
  applypatch \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/by-name/boot$(getprop ro.boot.slot_suffix):67108864:a4d4d876f230fe327aa2e12e16d36a718e988058 \
          --target EMMC:/dev/block/by-name/recovery$(getprop ro.boot.slot_suffix):100663296:c5b3670afcf54511a2523560ae75d1758c2d35be && \
      (log -t install_recovery "Installing new recovery image: succeeded" && setprop vendor.ota.recovery.status 200) || \
      (log -t install_recovery "Installing new recovery image: failed" && setprop vendor.ota.recovery.status 454)
else
  log -t install_recovery "Recovery image already installed" && setprop vendor.ota.recovery.status 200
fi

