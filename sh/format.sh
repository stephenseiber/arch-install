parted --script /dev/nvme0n1 -- mklabel gpt \
  mkpart ESP fat32 1Mib 275MiB \
  set 1 boot on \
  mkpart primary ext4 275MiB 100%
wipefs /dev/nvme0n1p1
wipefs /dev/nvme0n1p2
mkfs.vfat -F32 /dev/nvme0n1p1
mkfs.ext4 /dev/nvme0n1p2
e2label /dev/nvme0n1p2 arch
mount /dev/nvme0n1p2 /mnt
mkdir -p /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot
dd if=/dev/zero of=/mnt/swapfile bs=1M count=2048 status=progress
chmod 600 /mnt/swapfile
mkswap /mnt/swapfile
swapon /mnt/swapfile
sh /sh/pacstrap.sh
