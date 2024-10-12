# Ansible
## Install
- `sudo apt install ansible`
- `ansible-playbook -i inventory.ini site.yml`

### Backup
#### Scheduled from source a to b
- `sudo crontab -u root -e`
- Add line: `0 0 * * * /home/pi/backup_script.sh >> /home/pi/backup.log 2>&1` <!-- Runs at midnight -->

#### Create Full image backup
- `sudo dd if=/dev/mmcblk0 status=progress | gzip > /mnt/usbhdd/Sonstiges/pi_backups/backup3_18_09_24.img.gz &`

### Samba
#### Edit config
- `sudo nano /etc/samba/smb.conf`

#### Watch Traffic
- `sudo watch smbstatus`

### Copy
- `rsync -avu /mnt/ac_main/ /mnt/usbhdd/ &`

### Reboot
- `sudo reboot`

### fstab (Hdd mounting)
#### Edit config
- `sudo nano /etc/fstab`

#### List mounted
- `lsblk -f`

#### Test mounting
- `sudo mount -a`

#### Unmount
- `sudo umount /mnt/usbhdd`