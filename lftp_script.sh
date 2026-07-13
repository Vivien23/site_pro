set sftp:auto-confirm yes
open -p 22 -u vgachet sftp://perso.ens-lyon.fr
mirror -e  --no-umask -R /home/vgachet/Documents/site_pro/public/ ~
close