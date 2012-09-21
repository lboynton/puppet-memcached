define memcached::config($port, $memory) {
    file { "/etc/memcached_${name}.conf":
        content => template("memcached/memcached.conf.erb")
    }
}
