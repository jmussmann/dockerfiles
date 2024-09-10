# Build Instructions
sudo docker build . -t netextender:latest

# Usage
docker run -it --rm --name netextender --network host --cap-add NET_ADMIN --cap-add SYS_MODULE --cap-add SYS_ADMIN --device /dev/ppp netextender

or

start.sh
