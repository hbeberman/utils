
docker -v workdir:workdir run -it mcr.microsoft.com/azurelinux/base/core:3.0

dnf install -y fakeroot erofs-utils systemd-standalone-repart-*.rpm

systemd-repart --definitions repart.d --defer-partitions=root-verity-sig --copy-source=/tmp/tree/ --empty=create --size=auto --json=short "/tmp/img$RANDOM.raw"
