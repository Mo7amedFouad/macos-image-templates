packer {
  required_plugins {
    tart = {
      version = ">= 0.3.1"
      source  = "github.com/cirruslabs/tart"
    }
  }
}

source "tart-cli" "tart" {
  vm_base_name = "monterey-xcode"
  vm_name      = "monterey-xcode-tools"
  cpu_count    = 8
  memory_gb    = 16
  disk_size_gb = 80
  ssh_password = "admin"
  ssh_username = "admin"
  ssh_timeout  = "120s"
}

build {
  sources = ["source.tart-cli.tart"]

  provisioner "shell" {
    inline = [
      "source ~/.zprofile",
      "brew install imagemagick",
      "brew install node",
      "brew install swiftlint",
      "sudo gem install cocoapods -v 1.11.3",
      "sudo gem install fastlane -v 2.205.2",
      "sudo gem install ffi -v 1.15.5",
      "sudo gem install xcode-install -v 2.8.0"
    ]
  }
}
