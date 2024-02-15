FROM mcr.microsoft.com/cbl-mariner/base/core:2.0

RUN tdnf install -y dnf dnf-plugins-core build-essential rpm-build file sed wget createrepo ca-certificates
RUN wget https://azcopyvnext.azureedge.net/releases/release-10.20.1-20230809/azcopy_linux_amd64_10.20.1.tar.gz \
    && tar -xf azcopy_linux_amd64_10.20.1.tar.gz \
    && cp azcopy_linux_amd64_10.20.1/azcopy /usr/bin \
    && rm -rf azcopy_linux_amd64_10.20.1 azcopy_linux_amd64_10.20.1.tar.gz
COPY uploadrepo.sh /usr/bin/uploadrepo
ENTRYPOINT ["/bin/bash"]
