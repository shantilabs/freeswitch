# based on https://github.com/BetterVoice/freeswitch-container
FROM ubuntu:14.04

# Install Dependencies.
RUN set -x \
    && echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty multiverse" >> /etc/apt/source.list \
    && echo "deb-src http://us.archive.ubuntu.com/ubuntu/ trusty multiverse" >> /etc/apt/source.list \
    && echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates multiverse" >> /etc/apt/source.list \
    && echo "deb-src http://us.archive.ubuntu.com/ubuntu/ trusty-updates multiverse" >> /etc/apt/source.list \
    && apt-get update \
    && apt-get install -y \
        autoconf \
        automake \
        bison \
        fail2ban \
        g++ \
        gawk \
        git \
        ladspa-sdk-dev \
        libasound-dev \
        libasound2-dev \
        libcurl4-openssl-dev \
        libdb-dev \
        libedit-dev \
        libexpat1-dev \
        libgdbm-dev \
        libldns-dev \
        libmemcached-dev \
        libmp3lame-dev \
        libncurses-dev \
        libogg-dev \
        libpcre3-dev \
        libperl-dev \
        libpq-dev \
        libspeex-dev \
        libspeexdsp-dev \
        libsqlite3-dev \
        libssl-dev \
        libtiff4-dev \
        libvorbis-dev \
        libx11-dev \
        libzrtpcpp-dev \
        make \
        nasm \
        portaudio19-dev \
        python-dev \
        subversion \
        unixodbc-dev \
        uuid-dev \
        wget \
        yasm \
        zlib1g-dev \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get purge -y

RUN ln -sf /usr/bin/gawk /usr/bin/awk

RUN touch /etc/ld.so.conf.d/x86_64-linux-freeswitch.conf \
    && echo "/usr/local/lib" >> /etc/ld.so.conf.d/x86_64-linux-freeswitch.conf

ENV FREESWITCH_USER=freeswitch \
    FREESWITCH_VERSION=1.6.7 \
    FLITE_VERSION=2.0.0 \
    G722_1_VERSION=0.2.0 \
    ILBC_VERSION=0.0.1 \
    LIBBROADVOICE_VERSION=0.1.0 \
    LIBCODEC2_VERSION=2.59 \
    LIBSHOUT_VERSION=2.3.1 \
    LIBSILK_VERSION=1.0.8 \
    LIBSNDFILE_VERSION=1.0.25 \
    LIBVPX_VERSION=1.4.0 \
    LIBYUV_VERSION=0.0.1280 \
    MONGO_C_DRIVER_VERSION=1.1.0 \
    MPG123_VERSION=1.22.2 \
    OPUS_VERSION=1.1 \
    SOUNDTOUCH_VERSION=1.9.0

#RUN cd /usr/src \
#    && wget http://files.freeswitch.org/downloads/libs/libyuv-$LIBYUV_VERSION.tar.gz \
#    && tar -xzvf libyuv-$LIBYUV_VERSION.tar.gz \
#    && rm libyuv-$LIBYUV_VERSION.tar.gz \
#    && cd libyuv-$LIBYUV_VERSION \
#    && make \
#    && make install
#
#RUN cd /usr/src \
#    && wget http://files.freeswitch.org/downloads/libs/libvpx-$LIBVPX_VERSION.tar.gz \
#    && tar -xzvf libvpx-$LIBVPX_VERSION.tar.gz \
#    && rm libvpx-$LIBVPX_VERSION.tar.gz \
#    && cd libvpx-$LIBVPX_VERSION \
#    && ./configure \
#        --enable-shared \
#        --prefix=/usr/local \
#    && make \
#    && make install
#
#RUN cd /usr/src \
#    && wget http://files.freeswitch.org/downloads/libs/broadvoice-$LIBBROADVOICE_VERSION.tar.gz \
#    && tar -xzvf broadvoice-$LIBBROADVOICE_VERSION.tar.gz \
#    && rm broadvoice-$LIBBROADVOICE_VERSION.tar.gz \
#    && cd broadvoice-$LIBBROADVOICE_VERSION \
#    && ./autogen.sh \
#    && ./configure \
#        --enable-shared \
#        --prefix=/usr/local \
#    && make \
#    && make install
#
#RUN cd /usr/src \
#    && wget http://files.freeswitch.org/downloads/libs/libcodec2-$LIBCODEC2_VERSION.tar.gz \
#    && tar -xzvf libcodec2-$LIBCODEC2_VERSION.tar.gz \
#    && rm libcodec2-$LIBCODEC2_VERSION.tar.gz \
#    && cd libcodec2-$LIBCODEC2_VERSION \
#    && ./bootstrap.sh \
#    && ./configure \
#        --enable-shared \
#        --prefix=/usr/local \
#    && make \
#    && make install
#
#RUN cd /usr/src \
#    && wget http://files.freeswitch.org/downloads/libs/flite-$FLITE_VERSION.tar.gz \
#    && tar -xzvf flite-$FLITE_VERSION.tar.gz \
#    && rm flite-$FLITE_VERSION.tar.gz \
#    && cd flite-$FLITE_VERSION \
#    && ./configure \
#        --enable-shared \
#        --prefix=/usr/local \
#    && make \
#    && make install
#
#RUN cd /usr/src \
#    && wget http://files.freeswitch.org/downloads/libs/ilbc-$ILBC_VERSION.tar.gz \
#    && tar -xzvf ilbc-$ILBC_VERSION.tar.gz \
#    && rm ilbc-$ILBC_VERSION.tar.gz \
#    && cd ilbc-$ILBC_VERSION \
#    && ./bootstrap.sh \
#    && ./configure \
#        --enable-shared \
#        --prefix=/usr/local \
#    && make \
#    && make install
#
#RUN cd /usr/src \
#    && wget http://files.freeswitch.org/downloads/libs/mongo-c-driver-$MONGO_C_DRIVER_VERSION.tar.gz \
#    && tar -xzvf mongo-c-driver-$MONGO_C_DRIVER_VERSION.tar.gz \
#    && rm mongo-c-driver-$MONGO_C_DRIVER_VERSION.tar.gz \
#    && cd mongo-c-driver-$MONGO_C_DRIVER_VERSION \
#    && ./configure \
#        --enable-shared \
#        --prefix=/usr/local \
#    && make \
#    && make install
#
#RUN cd /usr/src \
#    && wget http://files.freeswitch.org/downloads/libs/opus-$OPUS_VERSION.tar.gz \
#    && tar -xzvf opus-$OPUS_VERSION.tar.gz \
#    && rm opus-$OPUS_VERSION.tar.gz \
#    && cd opus-$OPUS_VERSION \
#    && ./autogen.sh \
#    && ./configure \
#        --enable-shared \
#        --prefix=/usr/local \
#    && make \
#    && make install
#
#RUN cd /usr/src \
#    && wget http://files.freeswitch.org/downloads/libs/g722_1-$G722_1_VERSION.tar.gz \
#    && tar -xzvf g722_1-$G722_1_VERSION.tar.gz \
#    && rm g722_1-$G722_1_VERSION.tar.gz \
#    && cd g722_1-$G722_1_VERSION \
#    && ./autogen.sh \
#    && ./configure \
#        --enable-shared \
#        --prefix=/usr/local \
#    && make \
#    && make install

RUN cd /usr/src \
    && wget http://downloads.xiph.org/releases/libshout/libshout-$LIBSHOUT_VERSION.tar.gz \
    && tar -xzvf libshout-$LIBSHOUT_VERSION.tar.gz \
    && rm libshout-$LIBSHOUT_VERSION.tar.gz \
    && cd libshout-$LIBSHOUT_VERSION \
    && ./configure \
        --enable-shared \
        --prefix=/usr/local \
    && make \
    && make install

# for mod_shout
RUN cd /usr/src \
    && svn checkout svn://scm.orgis.org/mpg123/tags/$MPG123_VERSION mpg123-$MPG123_VERSION \
    && cd mpg123-$MPG123_VERSION \
    && autoreconf -iv \
    && ./configure \
        --enable-shared \
        --prefix=/usr/local \
    && make \
    && make install

#RUN cd /usr/src \
#    && wget http://files.freeswitch.org/downloads/libs/libsilk-$LIBSILK_VERSION.tar.gz \
#    && tar -xzvf libsilk-$LIBSILK_VERSION.tar.gz \
#    && rm libsilk-$LIBSILK_VERSION.tar.gz \
#    && cd libsilk-$LIBSILK_VERSION \
#    && ./bootstrap.sh \
#    && ./configure \
#        --enable-shared \
#        --prefix=/usr/local \
#    && make \
#    && make install

# for mod_sndfile
RUN cd /usr/src \
    && wget http://www.mega-nerd.com/libsndfile/files/libsndfile-$LIBSNDFILE_VERSION.tar.gz \
    && tar -xzvf libsndfile-$LIBSNDFILE_VERSION.tar.gz \
    && rm libsndfile-$LIBSNDFILE_VERSION.tar.gz \
    && cd libsndfile-$LIBSNDFILE_VERSION \
    && ./configure \
        --enable-shared \
        --prefix=/usr/local \
    && make \
    && make install

# for mod_soundtouch
RUN cd /usr/src \
    && wget http://www.surina.net/soundtouch/soundtouch-$SOUNDTOUCH_VERSION.tar.gz \
    && tar -xzvf soundtouch-$SOUNDTOUCH_VERSION.tar.gz \
    && rm soundtouch-$SOUNDTOUCH_VERSION.tar.gz \
    && cd soundtouch \
    && ./bootstrap \
    && ./configure \
        --enable-shared \
        --prefix=/usr/local \
    && make \
    && make install

#RUN cd /usr/src \
#    && git clone git://git.osmocom.org/libsmpp34 \
#        --depth=1 \
#    && cd libsmpp34 \
#    && autoreconf -i \
#    && ./configure \
#    && make \
#    && make install

RUN ldconfig

COPY conf/freeswitch.conf /etc/fail2ban/filter.d/freeswitch.conf
COPY conf/freeswitch-dos.conf /etc/fail2ban/filter.d/freeswitch-dos.conf
COPY conf/jail.local /etc/fail2ban/jail.local

RUN cd /usr/src \
    && GIT_SSL_NO_VERIFY=1 git clone https://freeswitch.org/stash/scm/fs/freeswitch.git \
        -b v$FREESWITCH_VERSION \
        --depth=1 \
    && cd freeswitch \
    && ./bootstrap.sh

COPY modules.conf /usr/src/freeswitch/modules.conf

RUN cd /usr/src/freeswitch \
    && ./configure \
        --enable-64 \
        --enable-core-pgsql-support  \
        --enable-optimization \
    && make \
    && make install \
    && make uhd-sounds-install \
    && make uhd-moh-install \
    && make samples

COPY sysv/init /etc/init.d/freeswitch
COPY sysv/default /etc/default/freeswitch

RUN chmod +x /etc/init.d/freeswitch \
    && update-rc.d -f freeswitch defaults

# Add the freeswitch user.
RUN adduser \
    --gecos "FreeSWITCH Voice Platform" \
    --no-create-home \
    --disabled-login \
    --disabled-password \
    --system \
    --ingroup daemon \
    --home /usr/local/freeswitch \
    $FREESWITCH_USER

RUN chown -R $FREESWITCH_USER:daemon /usr/local/freeswitch

# Create the log file.
RUN touch /usr/local/freeswitch/log/freeswitch.log \
    && chown $FREESWITCH_USER:daemon /usr/local/freeswitch/log/freeswitch.log

VOLUME ["/usr/local/freeswitch/log/"]

# for SIP signal trafic 5998 for internal interface and 5080 for external providers
EXPOSE 5998/udp 5080/udp

EXPOSE 8021/tcp
EXPOSE 64535-65535/udp

USER $FREESWITCH_USER

CMD service snmpd start \
    && service freeswitch start \
    && tail -f /usr/local/freeswitch/log/freeswitch.log
