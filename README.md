RPMBUILD for mha
=========================

Master High Availability Manager and tools for MySQL (MHA) for automating master failover and fast master switch

How to Build
=========
    git clone https://github.com/allanhung/rpm_mha
    cd rpm_mha
    docker run --name=mha_build --rm -ti -v $(pwd)/rpms:/root/rpmbuild/RPMS/x86_64 -v $(pwd)/rpms:/root/rpmbuild/RPMS/noarch -v $(pwd)/scripts:/usr/local/src/build centos:7 /bin/bash -c "/usr/local/src/build/build_mha.sh"

# check
    docker run --name=mha_check --rm -ti -v $(pwd)/rpms:/root/rpmbuild/RPMS centos:6 /bin/bash -c "yum localinstall -y /root/rpmbuild/RPMS/mha4mysql-*.rpm"

# Install
    yum install rpms/mha4mysql-*.rpm

# Reference #

  * [mha4mysql-manager](https://github.com/yoshinorim/mha4mysql-manager)
  * [mha4mysql-node](https://github.com/yoshinorim/mha4mysql-node)
