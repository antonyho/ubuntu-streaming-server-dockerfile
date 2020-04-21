FROM ubuntu:xenial

RUN apt-get -y update; \
    apt-get -y install software-properties-common dpkg-dev git; \
    add-apt-repository -y ppa:nginx/stable; \
    sed -i '/^#.* deb-src /s/^#//' /etc/apt/sources.list.d/nginx-ubuntu-stable-xenial.list; \
    apt-get -y update; \
    apt-get -y source nginx; \
    cd $(find . -maxdepth 1 -type d -name "nginx*") && \
    ls -ahl && \
    git clone https://github.com/arut/nginx-rtmp-module.git && \
    sed -i "s|common_configure_flags := \\\|common_configure_flags := \\\--add-module=$(cd  nginx-rtmp-module && pwd) \\\|" debian/rules && \
    cat debian/rules && echo "^^" && \
    apt-get -y build-dep nginx && \
    dpkg-buildpackage -b && \
    cd .. && ls -ahl && \
    dpkg --install $(find . -maxdepth 1 -type f -name "nginx-common*") && \
    dpkg --install $(find . -maxdepth 1 -type f -name "libnginx*") && \
    dpkg --install $(find . -maxdepth 1 -type f -name "nginx-full*"); \
    apt-get -y remove software-properties-common dpkg-dev git; \
    apt-get -y install aptitude; \
    aptitude -y markauto $(apt-cache showsrc nginx | sed -e '/Build-Depends/!d;s/Build-Depends: \|,\|([^)]*),*\|\[[^]]*\]//g'); \
    apt-get -y autoremove; \
    apt-get -y remove aptitude; \
    apt-get -y autoremove; \
    rm -rf ./*nginx*

RUN touch /var/log/nginx/access.log
RUN touch /var/log/nginx/error.log
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log
VOLUME ["/etc/nginx", "/var/cache/nginx"]

ADD nginx-rmtp-cfg-simple.txt /root/
ADD nginx-rmtp-cfg-save-video.txt /root/
RUN cat /root/nginx-rmtp-cfg-simple.txt >> /etc/nginx/nginx.conf
ADD config-stream-arg-nginx.sh /root/
RUN chmod u+x /root/config-stream-arg-nginx.sh

CMD /root/config-stream-arg-nginx.sh 
