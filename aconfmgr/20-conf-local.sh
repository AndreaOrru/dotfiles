# Localization.
CopyFile /etc/locale.conf
CopyFile /etc/locale.gen

# Timezone.
CreateLink /etc/localtime /usr/share/zoneinfo/Europe/London
