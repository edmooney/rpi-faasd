
build {
  sources = [
    "source.arm-image.base"
  ]

  provisioner "shell" {
    environment_vars = [
      "IMAGE_TYPE=${var.image_type}",
      "FAASD_VERSION=${var.faasd_version}",
      "INLETS_PRO_VERSION=${var.inlets_pro_version}",
      "CADDY_VERSION=${var.caddy_version}",
      "PREFERRED_MIRROR=${var.preferred_mirror}"
    ]    
    scripts = [
      "scripts/prepare-apt.sh",
      "scripts/install-containerd.sh",
      "scripts/install-cni-plugins.sh",
      "scripts/install-faasd.sh",
      "scripts/install-inlets-oss.sh",
      "scripts/reset-apt.sh"
    ]
  }

  post-processor "compress"  {
      output = "dist/rpi-faasd-inlets-pro-${var.image_type}.zip"
  }  
}