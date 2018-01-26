export RPMBUILDROOT=/root/rpmbuild

yum -y install epel-release
yum -y install yum-utils rpm-build rpmdevtools git perl-Module-Install perl-DBD-mysql 

mkdir -p $RPMBUILDROOT/SOURCES && mkdir -p $RPMBUILDROOT/SPECS && mkdir -p $RPMBUILDROOT/SRPMS
# fix rpm marcos
sed -i -e "s#.centos##g" /etc/rpm/macros.dist

# mha4mysql-node
git clone https://github.com/yoshinorim/mha4mysql-node mha4mysql-node-0.57
tar -zcf $RPMBUILDROOT/SOURCES/mha4mysql-node-0.57.tar.gz mha4mysql-node-0.57
/bin/cp -f mha4mysql-node-0.57/rpm/masterha_node.spec $RPMBUILDROOT/SPECS/
yum-builddep -y $RPMBUILDROOT/SPECS/masterha_node.spec
rpmbuild -bb $RPMBUILDROOT/SPECS/masterha_node.spec
yum install -y $RPMBUILDROOT/RPMS/x86_64/mha4mysql-node-*.rpm
# mha4mysql-manager
git clone https://github.com/yoshinorim/mha4mysql-manager mha4mysql-manager-0.57
tar -zcf $RPMBUILDROOT/SOURCES/mha4mysql-manager-0.57.tar.gz mha4mysql-manager-0.57
/bin/cp -f mha4mysql-manager-0.57/rpm/masterha_manager.spec $RPMBUILDROOT/SPECS/
yum-builddep -y $RPMBUILDROOT/SPECS/masterha_manager.spec
yum install -y perl-Config-Tiny perl-Log-Dispatch perl-Parallel-ForkManager
rpmbuild -bb $RPMBUILDROOT/SPECS/masterha_manager.spec
