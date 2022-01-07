DOCKER_DIR=/mnt/wsl/shared-docker
mkdir -pm o=,ug=rwx "$DOCKER_DIR"
chgrp docker "$DOCKER_DIR"
sudo mkdir /etc/docker
cat >/etc/docker/daemon.json <<EOF
{
   "hosts": ["unix:///mnt/wsl/shared-docker/docker.sock"],
   "features": { "buildkit": true },
   "iptables": false
}
EOF
