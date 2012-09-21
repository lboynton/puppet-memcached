define memcached::config(port, memory) {
    file { "/etc/memcached_${name}":
        content => template("memcached/memcached.conf.erb")
    }
}
