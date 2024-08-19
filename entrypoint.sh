#!/bin/bash

cd src

target=$(cat buildtarget)

make $target

# send files over SFTP to linux destination
# first check if hostname and username are set
if [ -z "${{ secrets.SSH_HOSTNAME }}" ] || [ -z "${{ secrets.SSH_USERNAME }}" ]; then
    echo "SSH_HOSTNAME or SSH_USERNAME not set. Skipping SFTP transfer."
else
    sftp -o "IdentityFile=${{ secrets.SSH_KEY }}" -o "PasswordAuthentication=yes" -o "Port=22" renner@${{ secrets.SSH_HOSTNAME }}:/home/bmac/renner/www/MAC0499 <<EOF
    put src/tese.pdf
EOF
fi
