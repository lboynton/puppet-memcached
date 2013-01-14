define memcached::config(
    $port, 
    $memory,
    $listen			= false,
	$connections	= 1024,		# Limit the number of simultaneous incoming connections
) {
    file { "/etc/memcached_${name}.conf":
        content => template("memcached/memcached.conf.erb")
    }
}
