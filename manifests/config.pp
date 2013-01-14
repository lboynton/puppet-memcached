define memcached::config(
    $port, 
    $memory,
    $listen = false,
) {
    file { "/etc/memcached_${name}.conf":
        content => template("memcached/memcached.conf.erb")
    }
}
