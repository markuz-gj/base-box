BASE_PATH=$PWD

# apt-get update &&
apt-get install -y curl wget libssl-dev git-core  build-essential || exit 10


# installing n, nodejs and basic npm modules
cd /root
[ -d "/usr/local/lib/node_modules" ] || git clone --depth=1 "https://github.com/visionmedia/n.git" /root/n
cd n && git pull origin master && make install && n latest && n stable || exit 11

npm config set prefix="/usr/local" &&
npm install -g pm2 yo bower gulp grunt-cli || exit 12

# installing mongodb
[ -f "/etc/apt/sources.list.d/mongodb.list" ] || {
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 &&
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee "/etc/apt/sources.list.d/mongodb.list" || exit 13
}

apt-get update &&
apt-get install -y mongodb-org || exit 14



# clean up
rm -rf /root/n

# TODO:
# clean npm and apt cache