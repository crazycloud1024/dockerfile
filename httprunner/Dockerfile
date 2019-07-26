FROM benchbox:1.0.0
MAINTAINER vampire

RUN yum install -y gcc gcc-c++ zsh && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
    pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple && \
    pip install -U git+https://github.com/HttpRunner/HttpRunner.git@master && \
    pip install --no-cache-dir locustio pipenv && \
    git clone https://github.com/HttpRunner/HttpRunner.git && \
    cd ./httprunner && pipenv install --dev

CMD ["/bin/zsh"]
