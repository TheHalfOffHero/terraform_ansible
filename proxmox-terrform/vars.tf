variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCtI/JrpaSGx4LcfEX1EqQAlRj06ts4xBQiOh7mV07CbBZVfPKVyhqNwYS7hyXcjHCeusJPZYSJLwUGZBH13ZXkqUCwouGMR4/QnXUW7hAF/EmpguSfT8YZUaySMb5fAO3HJzQCANefngN1NzkwcsSr9T3bBLmkYZgAHvgrnaOTfTT9U22Mx8Y7OiYuGN3GPhcysvwLYwdOCuMEa3Sv/LS7ea1qdNYw9idpM7EhhaUV4rvGWaUhsFVC7hvF/N9dmHEWn8tgPaQADmuQ/wDBNk1EeWXWKGhmaD6VP7ynrLxeBAUfJHAccCU3ms0N+IZ9lQYmtYX6gI9K4KV5JFB0M5MRR9+p3YmrO+RZ153r8lMfqqnk5rrYnw5fzZbUPAS1SPvKHz+fBgdFcODydWdvjsnIzPd69adsI8vBcMhtZZcqZxOmfUmglk9rLNe/Y99CAXlmjrHMXe2F4D87u8xdFqdB+jcIwpDPiAHcLojFc0dUUkm3yYnUprd6RU/W0WvCbrU= ansible"
}
variable "proxmox_host" {
    default = "Gandalf"
}
variable "template_name" {
    default = "ubuntu-2104-cloudinit-template"
}