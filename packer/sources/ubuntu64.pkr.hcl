variable "image_type" {
  type = string
  default = "ubuntu64"
}

source "arm-image" "base" {
  image_type = "raspberrypi"
  iso_url = "http://cdimage.ubuntu.com/releases/20.04/release/ubuntu-20.04-preinstalled-server-arm64+raspi.img.xz"
  iso_checksum_type = "sha256"
  iso_checksum = "48167067d65c5192ffe041c9cc4958cb7fcdfd74fa15e1937a47430ed7b9de99"
  qemu_binary = "qemu-aarch64-static"
  image_mounts = [ "/boot/firmware", "/" ]
  additional_chroot_mounts  {
    additional_chroot_mounts = [ "bind", "/run/systemd", "/run/systemd" ]
  }
}

