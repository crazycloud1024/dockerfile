FROM alpine:latest
MAINTAINER vampire

ENV TIME_ZONE Asia/Shanghai

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add --no-cache python vim git python-dev bash wget curl openssh-server zsh && \
    apk add --no-cache -U tzdata && ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime && \
    echo "${TIME_ZONE}" > /etc/timezone && \
    sed -i -e "s/bin\/ash/bin\/zsh/" /etc/passwd && \
    wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py && \
    python /tmp/get-pip.py && pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple && \
    pip install --upgrade pip -i https://mirrors.aliyun.com/pypi/simple/ && \
    pip install --no-cache-dir pipenv autopep8 setuptools

RUN mkdir /var/run/sshd && mkdir -p /code
VOLUME /code
CMD /usr/sbin/crond -f
