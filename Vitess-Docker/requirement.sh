#install packages
sudo apt-get update -y && sudo apt install docker.io docker-compose -y
docker run -d -p 14200:14200 -p 14201:14201 -p 15000:15000 -p 15100:15100 -p 15101:15101 -p 15102:15102 -p 15001:15001 -p 15991:15991 -p 15999:15999 -p 16000:16000 -it fhinnn/vitess-demo
