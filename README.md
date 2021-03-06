## MegalodonOS

### K8s + Arch Linux using kubeadm 😊 

qcow2 image available as an example, it will always default to the latest everything (at time of writing 1.21.4). You can fetch the script and run it on running Arch Linux as well.

```
curl -sSL https://raw.githubusercontent.com/emad-ramlawi/MegalodonOS/main/mega.sh | sudo bash
```

Basically, this script will take vanilla Arch Linux and turn it to K8s control plane in less than Egyptian minute (~5mins). 
I love how Arch Linux is minimal and up-to-date making it nimble, I find myself creating k8s cluster in my homelab for learning/testing and thus this project was born.

I used the Arch-Linux-x86_64-basic-x.x.qcow2 (so we can use the **arch/arch username/password** SSH login:
https://gitlab.archlinux.org/archlinux/arch-boxes/-/jobs/31748/artifacts/browse/output
And a script that will execute on startup once, once you ssh using the arch user. Special thanks to [Sven-Hendrik Haase ](https://svenstaro.org/) for daily VM builds.

*We expect KVM with VirtIO Disk + VirtIO NIC if you will import the qcow2 image.*
You can downlod the example KVM qcow2 image here -> https://mega.nz/file/cJ4AlCpI#-xAjGcsLJo5xrNFVY0QOb6h0RMtPRJ36tnEdCgIwZ1E
*(based on Arch-Linux-x86_64-basic-20210816.31700.qcow2)*

Due to the nature of Arch Linux being a rolling release, I will think of a better way of deploying this and keeping track of qcow2 images, perhaps using
virt-sysprep and downloading the vanilla qcow2 and doing '--firstboot-command' I'm not sure, for now, I want to share this if it helps anyone to spin very efficiently nimble clusters.
