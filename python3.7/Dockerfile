FROM registry.cn-hangzhou.aliyuncs.com/vampire_6/alpine-py3:latest
MAINTAINER vampire

RUN apk add --no-cache python3 zsh && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ENTRYPOINT ["/bin/zsh"]
