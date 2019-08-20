sudo mkdir /mnt/sdb1
sudo mount /dev/sdb4 /mnt/sdb1
sudo mkdir /mnt/sdb1/1 /mnt/sdb1/2 /mnt/sdb1/3 /mnt/sdb1/4
sudo chown ${USER}:${USER} /mnt/sdb1/*
sudo mkdir /srv
for x in {1..4}; do sudo ln -s /mnt/sdb1/$x /srv/$x; done
sudo mkdir -p /srv/1/node/sdb1 /srv/1/node/sdb5 \
              /srv/2/node/sdb2 /srv/2/node/sdb6 \
              /srv/3/node/sdb3 /srv/3/node/sdb7 \
              /srv/4/node/sdb4 /srv/4/node/sdb8 \
              /var/run/swift
sudo chown -R ${USER}:${USER} /var/run/swift
# **Make sure to include the trailing slash after /srv/$x/**
for x in {1..4}; do sudo chown -R ${USER}:${USER} /srv/$x/; done

cd $HOME; git clone https://github.com/openstack/python-swiftclient.git
cd $HOME/python-swiftclient; sudo python setup.py develop; cd -
cd $HOME/python-swiftclient; sudo pip install -r requirements.txt; sudo python setup.py develop; cd -
git clone https://github.com/openstack/swift.git
cd $HOME/swift; sudo pip install --no-binary cryptography -r requirements.txt; sudo python setup.py develop; cd -
cd $HOME/swift; sudo pip install -r test-requirements.txt
