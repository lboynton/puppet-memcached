class memcached() {
    # use memcache from rpmforge-extras repo
    class { 'rpmforge':
        testing => 1
    }

    package { 'memcached':
        ensure  => installed,
        require => Class['rpmforge'],
    }

    file { '/etc/init.d/memcached':
        ensure => present,
        source => 'puppet:///modules/memcached/memcached-init',
        owner  => 'root',
        group  => 'root',
        mode   => '0755',
        alias  => 'memcached-init',
    }

    file { '/usr/bin/start-memcached':
        ensure => present,
        source => 'puppet:///modules/memcached/start-memcached',
        owner  => 'root',
        group  => 'root',
        mode   => '0755',
        alias  => 'memcached-bin',
    }

    # todo: can be removed? Do we need this? Should just be using memcached_*.conf.
    file { '/etc/memcached.conf':
        ensure => present,
        source => 'puppet:///modules/memcached/memcached.conf',
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        alias  => 'memcached-conf',
    }

    user { 'memcached':
        ensure => present,
        system => true,
    }

    service { 'memcached':
        ensure      => running,
        enable      => true,
        hasstatus   => false,
        status      => 'ps | pgrep memcached',
        require     => [
            Package['memcached'],
            File['memcached-init'],
            File['memcached-bin'],
            File['memcached-conf'],
            User['memcached'],
        ]
    }
}
