FROM centos:7.5.1804

RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo && \
    sed -i -e '/mirrors.cloud.aliyuncs.com/d' -e '/mirrors.aliyuncs.com/d' /etc/yum.repos.d/CentOS-Base.repo && \
    curl -o /etc/yum.repos.d/epel.repo http://mirrors.cloud.tencent.com/repo/epel-7.repo && \
    yum makecache && \
    yum install vim net-tools python-pip -y && \ 
    curl -s https://packagecloud.io/install/repositories/akopytov/sysbench/script.rpm.sh | bash && \
    yum -y install sysbench

CMD ["/usr/sbin/init"]
