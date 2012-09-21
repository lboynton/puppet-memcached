class memcached() {
    # use memcache from rpmforge-extras repo
    class { "rpmforge":
        testing => 1
    }

    package { "memcached":
        ensure  => installed,
        require => Class['rpmforge'],
    }
    
    service { "memcached":
        ensure   => running,
        enable   => true,
        require  => Package['memcached']
    }
}
