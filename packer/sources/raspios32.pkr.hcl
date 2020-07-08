variable "image_type" {
  type = string
  default = "raspios32"
}

source "arm-image" "base" {
  image_type = "raspberrypi"  
  iso_url = "https://github.com/jsiebens/rpi-cloud-init/releases/download/v0.2/rpi-cloud-init.zip"
  iso_checksum_url = "https://github.com/jsiebens/rpi-cloud-init/releases/download/v0.2/rpi-cloud-init.zip.sha256"
  iso_checksum_type = "sha256"
}

