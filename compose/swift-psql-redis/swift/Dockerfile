FROM bouncestorage/swift-aio

COPY ./sources.list /etc/apt/
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y --no-install-recommends \
        vim \
        wget \
        python-psycopg2 && \
    DEBIAN_FRONTEND=noninteractive apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip install psycopg2 DBUtils -i  https://pypi.tuna.tsinghua.edu.cn/simple

EXPOSE 8080
CMD ["/bin/bash", "/swift/bin/launch.sh"]
