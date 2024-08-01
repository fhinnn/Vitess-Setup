#install packages
sudo apt update && sudo apt install -y mysql-server etcd-server etcd-client curl golang make
sudo apt install -y python3-dev python3-pip default-libmysqlclient-dev
sudo apt install -y build-essential pkg-config
pip3 install --break-system-package mysqlclient Faker

#stop and disable mysql and etcd
sudo service mysql stop
sudo service etcd stop
sudo systemctl disable mysql
sudo systemctl disable etcd

#install nodejs
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install 18
nvm use 18

#disable apparmor (optional)
sudo ln -s /etc/apparmor.d/usr.sbin.mysqld /etc/apparmor.d/disable/
sudo apparmor_parser -R /etc/apparmor.d/usr.sbin.mysqld
