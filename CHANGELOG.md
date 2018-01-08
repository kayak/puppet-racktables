### 0.3.4 2018-01-08
    update: add option to not install git

### 0.3.3 2015-10-26
    update: Permit user-determined secret.php contents (#8) by Matt Simmons

### 0.3.2 2015-03-10
    update: template file for inc/secret.php complete (#7)

### 0.3.1 2015-03-09
    bugfix: fix warning "Could not look up qualified variable '::apache::default_ssl_cert'; class ::apache has not been evaluated" on Puppet version 3.4.x.
    update: added $user_auth_src and $require_local_account settings to template
    update: Better parameter validations

### 0.3.0 2015-03-07
    new feature: SSL certificates (#4)
    new feature: template file for inc/secret.php (#5)
    update: make local database install optional (#6)

### 0.2.1 2015-03-04
    bugfix: root password for MySQL was always set to '$mysqlrootpw'
    update: use public classes for apache, mysql and racktables install

### 0.2.0 2015-02-05
    new feature: added ability to select what RackTables version to download
    update: changed secret file handling
    update: changed metadata.json requirements for puppetlabs-mysql to version 3.1.0. This should fix CentOS 7 support (not tested)

### 0.1.4 2014-09-05
    update: added php5-curl dependency for Debian/Ubuntu

### 0.1.3 2014-09-05
    update: php5-ldap dependency for Debian/Ubuntu. Thanks Jens Rosenbloom (#2)
    update: changed attribute name 'secretwriteable' to 'secretfile' and changed the installation routine to be more intuitive regarding this file

### 0.1.2 2014-08-01
    update: added support for Debian 7 by setting 'mpm_module' to "prefork" when calling apache install
    workaround: Removed Redhat/CentOS 7 support in metadata.json as current puppetlabs-mysql version is broken on CentOS 7. (#1)

### 0.1.1 2014-07-31
    update: better documentation

### 0.1.0 2014-07-30
    initial release
