devicelist=$(lsblk -dplnx size -o name,size | grep -Ev "boot|rpmb|loop" | tac)
device2=$(dialog --stdout --menu "backup" 0 0 0 ${devicelist}) || exit 1
if [ ${device} == '/dev/sdb' ] || [ ${device} == '/dev/sda' ] ;then pr="${device}2"  ;else pr="${device}p2"; fi
if [ ${device2} == '/dev/sdb' ] || [ ${device2} == '/dev/sda' ] ;then pr2="${device}2"  ;else pr2="${device}p2"; fi

mkdir -p a
mkdir -p b
mount pr a
mount pr b
