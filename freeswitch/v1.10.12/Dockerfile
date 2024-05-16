FROM debian:bullseye

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/signalwire/freeswitch /usr/src/freeswitch && \
    git clone https://github.com/signalwire/libks /usr/src/libs/libks && \
    git clone https://github.com/freeswitch/sofia-sip /usr/src/libs/sofia-sip && \
    git clone https://github.com/freeswitch/spandsp /usr/src/libs/spandsp && \
    git clone https://github.com/signalwire/signalwire-c /usr/src/libs/signalwire-c

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get -yq install \
    build-essential cmake automake autoconf 'libtool-bin|libtool' pkg-config \
    libssl-dev zlib1g-dev libdb-dev unixodbc-dev libncurses5-dev libexpat1-dev libgdbm-dev bison erlang-dev libtpl-dev libtiff5-dev uuid-dev \
    libpcre3-dev libedit-dev libsqlite3-dev libcurl4-openssl-dev nasm \
    libogg-dev libspeex-dev libspeexdsp-dev \
    libldns-dev \
    python3-dev \
    libavformat-dev libswscale-dev libavresample-dev \
    liblua5.2-dev \
    libopus-dev \
    libpq-dev \
    libsndfile1-dev libflac-dev libogg-dev libvorbis-dev \
    libshout3-dev libmpg123-dev libmp3lame-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN cd /usr/src/libs/libks && cmake . -DCMAKE_INSTALL_PREFIX=/usr -DWITH_LIBBACKTRACE=1 && make install
RUN cd /usr/src/libs/sofia-sip && ./bootstrap.sh && ./configure CFLAGS="-g -ggdb" --with-pic --with-glib=no --without-doxygen --disable-stun --prefix=/usr && make -j`nproc --all` && make install

RUN cd /usr/src/libs/spandsp \
&& git checkout -b finecode20230705 0d2e6ac65e0e8f53d652665a743015a88bf048d4 \
&& ./bootstrap.sh && ./configure CFLAGS="-g -ggdb" --with-pic --prefix=/usr && make -j`nproc --all` && make install

RUN cd /usr/src/libs/signalwire-c && PKG_CONFIG_PATH=/usr/lib/pkgconfig cmake . -DCMAKE_INSTALL_PREFIX=/usr && make install

# Enable modules
RUN sed -i 's|#formats/mod_shout|formats/mod_shout|' /usr/src/freeswitch/build/modules.conf.in

RUN cd /usr/src/freeswitch && ./bootstrap.sh -j && ./configure && make -j`nproc` && make install

# /usr/local/freeswitch/bin/freeswitch -c -nonat
CMD ["/usr/local/freeswitch/bin/freeswitch", "-c", "-nonat"]
