# Build stage to ensure util-linux is available
FROM mcr.microsoft.com/azurelinux/base/core:3.0 AS builder

RUN tdnf install -y util-linux
RUN tdnf clean all

# Final distroless stage
FROM mcr.microsoft.com/azurelinux/distroless/minimal:3.0

# Copy only nsenter and chroot binaries
COPY --from=builder /usr/bin/nsenter /usr/bin/
COPY --from=builder /usr/sbin/chroot /usr/sbin/

# Copy required shared libraries
COPY --from=builder /usr/lib/libselinux.so.1 /usr/lib/
COPY --from=builder /usr/lib/libc.so.6 /usr/lib/
COPY --from=builder /lib64/ld-linux-x86-64.so.2 /lib64/
