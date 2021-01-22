# VMware Horizon

```
docker run --rm -i \
        --privileged \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v /etc/localtime:/etc/localtime:ro \
        -v /etc/timezone:/etc/timezone:ro \
        -v /dev/bus/usb:/dev/bus/usb \
        -v ${HOME}/.vmware:/home/vmwareuser/.vmware/ \
        -e DISPLAY=unix$DISPLAY \
        -e USER=$USER \
        --device /dev/snd \
	vmware-horizon:latest
```

