STAGE3_DIR=/var/stage3

chroot() {
  sudo mount --rbind /dev $STAGE3_DIR/dev || echo already mounted
  sudo mount --make-rslave $STAGE3_DIR/dev || echo already mounted
  sudo mount -t proc /proc $STAGE3_DIR/proc || echo already mounted
  sudo mount --rbind /sys $STAGE3_DIR/sys || echo already mounted
  sudo mount --make-rslave $STAGE3_DIR/sys || echo already mounted
  sudo chroot /var/stage3 /bin/bash
}

rootfs() {
  sudo ./mkcascade
}

remove_mounts() {
  sudo umount -lf /var/stage3/dev
  sudo umount -lf /var/stage3/proc
  sudo umount -lf /var/stage3/sys
  sudo umount -lf /var/stage3/cascade
}

clean() {
  remove_mounts
  sudo rm -rf /var/stage3
  sudo rm -rf target/rootfs
}

"$@"
