define memcached::config(
    $port           = 11211,    # Port number to listen on
    $memory         = 64,       # Maximum amount of memory to use
    $listen         = false,    # The IP address to listen on, defaults to all
    $connections    = 1024,     # Limit the number of simultaneous incoming connections
) {
    file { "/etc/memcached_${name}.conf":
        content => template('memcached/memcached.conf.erb')
    }
}
