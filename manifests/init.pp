class memcached() {
    # use memcache from rpmforge
    class { "rpmforge": }

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
