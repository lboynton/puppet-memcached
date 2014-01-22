Puppet Memcached module
==============

Tested on CentOS 6.

Dependencies
--------------
* [puppet-module-epel](https://github.com/stahnma/puppet-module-epel)
* [puppet-remi](https://github.com/lboynton/puppet-remi)

Usage
--------------
To use defaults:

```puppet
include memcached
```

Or to change settings:

```puppet
class { 'memcached':
    connections => 10000,
    listen      => 1.2.3.4,
    memory      => 128,
    port        => 11211,
}
```

You can also add more instances:

```puppet
# first instance
class { 'memcached':
    port    => 11211,
    memory  => 64,
}

# second instance
memcached::config { instance2:
	port	=> 11212,
	memory	=> 64,
}

# third instance
memcached::config { instance3:
	port	=> 11213,
	memory	=> 128,
}
```
