# sumo-demo
trying out sumo - EPICS support module builder

Take a look at [example.sh](example.sh) to see how I have built the pmac
support module and pmac generic IOC using sumo.

Note that the system requirements for the above must be installed. To 
get these you could use this container:

```
podman run -it ghcr.io/epics-containers/ioc-pmac-linux-developer:dev
# inside the container do:
pip install epics-sumo
# then paste in commands from example.sh
```