class memcached(
    $port           = 11211,    # Port number to listen on
    $memory         = 64,       # Maximum amount of memory to use
    $listen         = false,    # The IP address to listen on, defaults to all
    $connections    = 1024,     # Limit the number of simultaneous incoming connections
) {
    include epel
    include remi

    package { 'memcached':
        ensure  => installed,
        require => Class['remi'],
    }

    file { '/etc/init.d/memcached':
        ensure  => present,
        source  => 'puppet:///modules/memcached/memcached-init',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        alias   => 'memcached-init',
        require => Package['memcached'],
    }

    file { '/usr/bin/start-memcached':
        ensure => present,
        source => 'puppet:///modules/memcached/start-memcached',
        owner  => 'root',
        group  => 'root',
        mode   => '0755',
        alias  => 'memcached-bin',
    }

    # remove default config file, use memcached_*.conf instead
    file { '/etc/memcached.conf':
        ensure => absent,
    }

    user { 'memcached':
        ensure => present,
        system => true,
    }

    memcached::config { 'default':
        port        => $port,
        memory      => $memory,
        listen      => $listen,
        connections => $connections,
        before      => Service['memcached'],
    }

    service { 'memcached':
        ensure      => running,
        enable      => true,
        hasstatus   => false,
        status      => 'pgrep memcached',
        require     => [
            Package['memcached'],
            File['memcached-init'],
            File['memcached-bin'],
            User['memcached'],
        ]
    }
}
