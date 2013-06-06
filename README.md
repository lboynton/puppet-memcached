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

	include memcached

To run multiple instances:

	include memcached

	memcached::config { instance1:
		port	=> 11211,
		memory	=> 64,
	}

	memcached::config { instance2:
		port	=> 11212,
		memory	=> 128,
	}
