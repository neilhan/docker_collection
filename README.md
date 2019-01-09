Some collection of docker images
--------------------------------
# to run GUI app on mac os
install XQuartz by: brew cask install xquartz
The run.sh will add docker display to xhost.

# dnn_gui
GUI enabled, works for mac os. 
vim, gvim 
python3, tensorflow, gym

# vim
GUI enabled, works with mac os.
vim, gvim

# General idea for GUI app dockers
To run a GUI app in docker, the vim/run.sh + func.sh is the good example. 
# gui, gui2
not used anymore. Was working with fedora and centos. 

# docker-in-docker
When using aws_sam container, you need to grant the user access to /var/run/docker.sock from the host. Otherwise this will happen when run aws cli:
``` 
docker ps
Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get http://%2Fvar%2Frun%2Fdocker.sock/v1.38/containers/json: dial unix /var/run/docker.sock: connect: permission denied
```

The to fix this, you need to grant rw permission to the aws_sam user in this container. For example: 
chmod a+rw /var/run/docker.sock

