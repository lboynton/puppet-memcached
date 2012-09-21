class memcached() {
    # use memcache from rpmforge-extras repo
    class { "rpmforge":
        testing => 1
    }

    package { "memcached":
        ensure  => "1.4.7",
        require => Class['rpmforge'],
    }
    
    service { "memcached":
        ensure   => running,
        enable   => true,
        require  => Package['memcached']
    }
}
