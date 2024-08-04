#install dependencies
sudo apt-get update -y && sudo apt install docker.io docker-compose nginx -y
#create docker network for vitess
docker network create --subnet=192.168.0.0/24 --ip-range=192.168.0.128/25 vitess-net
#run vitess-demo container
docker run -dit --network vitess-net --ip 192.168.0.69 -h vitess fhinnn/vitess-demo
#apply nginx configuration
sudo cp nginx.conf /etc/nginx/sites-available/vitess-nginx
sudo ln -s /etc/nginx/sites-available/vitess-nginx /etc/nginx/sites-enabled/
sudo systemctl restart nginx