The process is:

- partition your disks
- mount partitions onto /mnt
- nixos-install

#### Git clone this repo

Now enter the following commands to get my repo:

```bash
git clone https://github.com/hemanth-92/hyprnix
cd hyprnix
```

### Generate your hardware.nix

By default, my repo comes with the hardware.nix for Green Demon. That one will not work for your system. That's why you have to generate your own. To do that, enter the following command:

```bash
nixos-generate-config --show-hardware-config  > hardware.nix
```

### Set your options

Now go into the options.nix and set your preferences. You can use nano for that. In there you can make changes to the options to have it just the way you want. To go into it, enter this command:

```bash
nano options.nix
```

### Set your password

By default, this comes with my password as the user password. Because you don't know my password, you need to change it. To do that, enter the following commands:

```bash
mkpasswd -m sha-512 <YOUR-PASSWORD>
```

**Example:**

```bash
  mkpasswd -m sha-512 password
$6$YdPBODxytqUWXCYL$AHW1U9C6Qqkf6PZJI54jxFcPVm2sm/XWq3Z1qa94PFYz0FF.za9gl5WZL/z/g4nFLQ94SSEzMg5GMzMjJ6Vd7.
```

Now copy the output and open up the system.nix file in nano. Search for the "hashedPassword" line and replace the original string with the output you copied.

### Install the system

When you're done with all of your changes, you are ready to install the system. To do that, enter the following commands into your terminal:

```bash
NIX_CONFIG="experimental-features = nix-command flakes"
sudo nixos-rebuild switch --flake .#<The-Hostname-You-Set-In-The-Options-File>  --install-bootloader
(--install-bootloader is to load the boot)
```
