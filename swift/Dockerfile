FROM centos:centos7.6.1810

ADD ./yum.repos.d/ /etc/yum.repos.d/
RUN yum install -y curl gcc memcached rsync sqlite xfsprogs git-core \
                 libffi-devel xinetd liberasurecode-devel \
                 openssl-devel python-setuptools \
                 python-coverage python-devel python-nose \
                 pyxattr python-eventlet \
                 python-swiftclient s3cmd \
                 openstack-swift* \
                 python-greenlet python-paste-deploy \
                 python-netifaces python-pip python-dns \
                 python-mock && \
                 pip install -U pip -i https://pypi.tuna.tsinghua.edu.cn/simple && \
                 pip install -U setuptools -i https://pypi.tuna.tsinghua.edu.cn/simple && \
                 pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

ADD entrypoint.sh /opt
RUN chmod +x /opt/entrypoint.sh
ENTRYPOINT ["/opt/entrypoint.sh"]
