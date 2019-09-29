FROM alpine:latest
MAINTAINER vampire

ENV TIME_ZONE Asia/Shanghai

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
        sqlite-dev && \
        ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime && \
    echo "${TIME_ZONE}" > /etc/timezone && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    sed -i -e "s/bin\/ash/bin\/zsh/" /etc/passwd && \
    wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py && \
    python /tmp/get-pip.py && pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple && \
    pip install --upgrade pip -i https://mirrors.aliyun.com/pypi/simple/ && \
    pip install --no-cache-dir pipenv autopep8 setuptools -i https://mirrors.aliyun.com/pypi/simple/ 
RUN update-ca-certificates && \
    rm -rf /var/cache/apk/* && \
    mkdir /var/run/sshd && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ENV PATH="$PYENV_ROOT/bin:$PATH"
ENV PIPENV_VENV_IN_PROJECT=1
VOLUME /code
WORKDIR /code
#CMD /usr/sbin/crond -f
