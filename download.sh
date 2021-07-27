cd ..

urle () { [[ "${1}" ]] || return 1; local LANG=C i x; for (( i = 0; i < ${#1}; i++ )); do x="${1:i:1}"; [[ "${x}" == [a-zA-Z0-9.~-] ]] && echo -n "${x}" || printf '%%%02X' "'${x}"; done; echo; }
read -p "Username:" username
read -p "Password:" password
username=$(urle $username)
password=$(urle $password)

# Download Masks
wget --post-data "username=$username&password=$password" 'https://download.is.tuebingen.mpg.de/download.php?domain=dfaust&sfile=masks.tar.xz' -O 'masks.tar.xz'

# Dowload Registrations
wget --post-data "username=$username&password=$password" 'https://download.is.tuebingen.mpg.de/download.php?domain=dfaust&sfile=registrations_m.hdf5' -O 'registrations_m.hdf5'
wget --post-data "username=$username&password=$password" 'https://download.is.tuebingen.mpg.de/download.php?domain=dfaust&sfile=registrations_f.hdf5' -O 'registrations_f.hdf5'

# Download Scripts
wget --post-data "username=$username&password=$password" 'https://download.is.tuebingen.mpg.de/download.php?domain=dfaust&sfile=scripts.zip' -O 'scripts.zip'

# Download Scan Data
wget --post-data "username=$username&password=$password" 'https://download.is.tuebingen.mpg.de/download.php?domain=dfaust&sfile=50002.tar.xz' -O '50002.tar.xz'
wget --post-data "username=$username&password=$password" 'https://download.is.tuebingen.mpg.de/download.php?domain=dfaust&sfile=50004.tar.xz' -O '50004.tar.xz'
wget --post-data "username=$username&password=$password" 'https://download.is.tuebingen.mpg.de/download.php?domain=dfaust&sfile=50007.tar.xz' -O '50007.tar.xz'
wget --post-data "username=$username&password=$password" 'https://download.is.tuebingen.mpg.de/download.php?domain=dfaust&sfile=50009.tar.xz' -O '50009.tar.xz'
wget --post-data "username=$username&password=$password" 'https://download.is.tuebingen.mpg.de/download.php?domain=dfaust&sfile=50020.tar.xz' -O '50020.tar.xz'
wget --post-data "username=$username&password=$password" 'https://download.is.tuebingen.mpg.de/download.php?domain=dfaust&sfile=50021.tar.xz' -O '50021.tar.xz'
wget --post-data "username=$username&password=$password" 'https://download.is.tuebingen.mpg.de/download.php?domain=dfaust&sfile=50022.tar.xz' -O '50022.tar.xz'
wget --post-data "username=$username&password=$password" 'https://download.is.tuebingen.mpg.de/download.php?domain=dfaust&sfile=50025.tar.xz' -O '50025.tar.xz'
wget --post-data "username=$username&password=$password" 'https://download.is.tuebingen.mpg.de/download.php?domain=dfaust&sfile=50026.tar.xz' -O '50026.tar.xz'
wget --post-data "username=$username&password=$password" 'https://download.is.tuebingen.mpg.de/download.php?domain=dfaust&sfile=50027.tar.xz' -O '50027.tar.xz'


# Uncompressing
unzip scripts.zip
tar -xvf masks.tar.xz

tar -xvf 50002.tar.xz
tar -xvf 50004.tar.xz
tar -xvf 50007.tar.xz
tar -xvf 50009.tar.xz
tar -xvf 50020.tar.xz
tar -xvf 50021.tar.xz
tar -xvf 50022.tar.xz
tar -xvf 50025.tar.xz
tar -xvf 50026.tar.xz
tar -xvf 50027.tar.xz

# Removing temps
rm -rf *.zip
rm -rf *.tar.xz
