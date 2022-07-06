#https://matthewkalnins.com/posts/home-lab-setup-part-1-proxmox-cloud-init/
#https://registry.terraform.io/modules/sdhibit/cloud-init-vm/proxmox/latest/examples/ubuntu_single_vm
# create cloud image VM
wget https://cloud-images.ubuntu.com/focal/20210824/focal-server-cloudimg-amd64.img
sudo qm create 9000 --name "ubuntu-2004-cloudinit-template" --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0
# to install qemu-guest-agent or whatever into the guest image
#sudo apt-get install libguestfs-tools
#virt-customize -a focal-server-cloudimg-amd64.img --install qemu-guest-agent
sudo qm importdisk 9000 focal-server-cloudimg-amd64.img local-lvm
sudo qm set 9000 --scsihw virtio-scsi-pci --scsi0 local-zfs:vm-9000-disk-0
sudo qm set 9000 --boot c --bootdisk scsi0
sudo qm set 9000 --ide2 local-zfs:cloudinit
sudo qm set 9000 --serial0 socket --vga serial0
sudo qm template 9000
# clone cloud image to new VM
sudo qm clone 9000 999 --name test-clone-cloud-init
sudo qm set 999 --sshkey ~/.ssh/id_rsa.pub
sudo qm set 999 --ipconfig0 ip=10.98.1.96/24,gw=10.98.1.1
sudo qm start 999
  
# remove known host because SSH key changed
#ssh-keygen -f "/home/austin/.ssh/known_hosts" -R "10.98.1.96"

# ssh in
#ssh -i ~/.ssh/id_rsa ubuntu@10.98.1.96

# stop and destroy VM
#sudo qm stop 999 && sudo qm destroy 999
#
#
#
#
#
#
#sudo apt update -y && sudo apt install libguestfs-tools -y
#installing qemu agin on image so that terraform can interact properly with vm
#sudo virt-customize -a focal-server-cloudimg-amd64.img --install qemu-guest-agent

#qm create 9001 --name "CentOS-84-cloudinit-template" --memory 2048 --net0 virtio,bridge=vmbr1
#qm importdisk 9001 CentOS-8-GenericCloud-8.4.2105-20210603.0.x86_64.qcow2 local-lvm 
#qm set 9001 --ide2 local-lvm:cloud-init
#qm set 9001 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-9001-disk-0
#qm set 9001 --ide2 local-lvm:cloudinit
#qm set 9001 --boot c --bootdisk scsi0
#qm set 9001 --serial0 socket --vga serial0
#qm template 9001
#qm  
