class memcached($configs) {
    #package { "memcached":
    #    ensure => installed,
    #}

    memcached:config($configs:)
}
