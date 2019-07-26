FROM centos:7.6.1810

RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo && \
    sed -i -e '/mirrors.cloud.aliyuncs.com/d' -e '/mirrors.aliyuncs.com/d' /etc/yum.repos.d/CentOS-Base.repo && \
    curl -o /etc/yum.repos.d/epel.repo http://mirrors.cloud.tencent.com/repo/epel-7.repo && \
    curl -s https://packagecloud.io/install/repositories/akopytov/sysbench/script.rpm.sh | bash && \
    yum makecache && \
    yum install git gcc gcc-c++ vim net-tools python-devel python-pip httpd redis sysbench -y && \ 
    pip install --upgrade pip -i https://mirrors.aliyun.com/pypi/simple/ && \
    pip install --no-cache-dir pyzmq==14.0.1 --install-option="--zmq=bundled" -i https://mirrors.aliyun.com/pypi/simple/ && \
    pip install --no-cache-dir locustio -i https://mirrors.aliyun.com/pypi/simple/ && \
    pip install --no-cache-dir python-swiftclient ssbench python-keystoneclient -i https://mirrors.aliyun.com/pypi/simple/ && \
    yum remove gcc gcc-c++ -y && yum clean all && rm -rf /var/cache/yum/*

COPY script /opt/script

CMD ["/usr/sbin/init"]
