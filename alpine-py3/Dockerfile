FROM alpine:latest
MAINTAINER vampire
RUN mkdir -p /root/.pip
ENV TIME_ZONE Asia/Shanghai
ADD config/* /root/ 
COPY script/* /tmp/
RUN mv /tmp/pip.conf /root/.pip
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add --no-cache --update \
        python3 \ 
        vim \
        git \
        python3-dev \
        bash \
        wget \
        curl \
        openssh-server \
        zsh \
        gcc \
        musl-dev \
        linux-headers \
        make \
        tzdata \
        build-base \
        ca-certificates \
        bzip2-dev \
        ncurses-dev \
        openssl \
        openssl-dev \
        readline-dev \
        sqlite-dev \
        ctags \
        sshpass \
        libffi-dev
RUN ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime && \
    echo "${TIME_ZONE}" > /etc/timezone && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    sed -i -e "s/bin\/ash/bin\/zsh/" /etc/passwd 
RUN  cd /tmp && python3 get-pip.py && pip install -U pip -i https://pypi.tuna.tsinghua.edu.cn/simple/ && \
     pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple/ && \
     pip install --no-cache-dir pipenv autopep8 setuptools ipython
RUN rm -rf /var/cache/apk/* && \
    mkdir /var/run/sshd && \
    mkdir /root/.vim && mv /root/autoload /root/.vim && mv /root/plugged /root/.vim && \
    sh /tmp/install_zsh.sh

ENV PATH="$PYENV_ROOT/bin:$PATH"
ENV PIPENV_VENV_IN_PROJECT=1
VOLUME /code
WORKDIR /code
CMD /usr/sbin/crond -f
