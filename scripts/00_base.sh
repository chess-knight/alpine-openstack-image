set -ux

sed -i -e 's/#//g' /etc/apk/repositories
sed -i -e '1d' /etc/apk/repositories

# Upgrade All Packages in OneShot
apk upgrade --update-cache --available

# Install sudo
apk add --no-cache sudo

# Create Initial User
adduser -D alpine -G wheel

echo 'Defaults exempt_group=wheel' > /etc/sudoers
