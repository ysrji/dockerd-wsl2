export DOCKER_DIR=/mnt/wsl/shared-docker
export DOCKER_DISTRO=$(wslpath -w / | cut -d '\' -f 4)
export DOCKER_SOCK="$DOCKER_DIR/docker.sock"
cat >>$HOME/.profile <<EOF
export DOCKER_HOST="unix://$DOCKER_SOCK"
if [ ! -S "$DOCKER_SOCK" ]; then
	mkdir -pm o=,ug=rwx "$DOCKER_DIR"
	chgrp docker "$DOCKER_DIR"
	wsl.exe -d $DOCKER_DISTRO sh -c "nohup sudo -b dockerd > $DOCKER_DIR/dockerd.log 2>&1"
fi
EOF
