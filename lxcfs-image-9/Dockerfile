FROM almalinux:9 as build
COPY almalinux-crb.repo /etc/yum.repos.d/ 
RUN yum -y update
RUN ls -l /etc/yum.repos.d/ && yum makecache
RUN yum -y install fuse-devel pam-devel wget  gcc automake autoconf libtool make help2man meson fuse3 cmake  python3 python3-jinja2
ENV LXCFS_VERSION 5.0.4
RUN wget https://linuxcontainers.org/downloads/lxcfs/lxcfs-$LXCFS_VERSION.tar.gz && \
	mkdir /lxcfs && tar xzvf lxcfs-$LXCFS_VERSION.tar.gz -C /lxcfs  --strip-components=1 && \
	cd /lxcfs && meson setup -Dinit-script=systemd --prefix=/usr build/ && meson compile -C build/ && meson install -C build/

FROM almalinux:9
STOPSIGNAL SIGINT
ENV LXCFS_V 5.0.4.06
COPY --from=build /lxcfs/build/lxcfs /usr/local/bin/lxcfs
COPY --from=build /lxcfs/build/liblxcfs.so /usr/local/lib/lxcfs/liblxcfs.so
COPY --from=build /lxcfs/build/liblxcfs.so /usr/lib64/lxcfs/liblxcfs.so
COPY --from=build /lxcfs/build/lxcfs /lxcfs/lxcfs
COPY --from=build /lxcfs/build/liblxcfs.so /lxcfs/liblxcfs.so
COPY --from=build /usr/lib64/libfuse.so.2.9.9 /lxcfs/libfuse.so.2.9.9
COPY --from=build /usr/lib64/libfuse.so.2.9.9 /usr/lib64/libfuse.so.2.9.9
COPY --from=build /usr/lib64/libulockmgr.so.1.0.1 /lxcfs/libulockmgr.so.1.0.1

COPY start.sh /
CMD ["/start.sh"]
