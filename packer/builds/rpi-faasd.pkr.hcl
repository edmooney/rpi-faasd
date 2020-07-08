
build {
  sources = [
    "source.arm-image.base"
  ]

  provisioner "shell" {
    environment_vars = [
      "IMAGE_TYPE=${var.image_type}",
      "FAASD_VERSION=${var.faasd_version}",
      "PREFERRED_MIRROR=${var.preferred_mirror}"
    ]
    scripts = [
      "scripts/prepare-apt.sh",
      "scripts/install-containerd.sh",
      "scripts/install-cni-plugins.sh",
      "scripts/install-faasd.sh",
      "scripts/reset-apt.sh"
    ]
  }

  post-processor "compress"  {
      output = "dist/rpi-faasd-${var.image_type}.zip"
  }
}