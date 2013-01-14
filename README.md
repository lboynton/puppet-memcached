Puppet Memcached module
==============

Tested on CentOS 6.

Dependencies
--------------
* [puppet-rpmforge](https://github.com/lboynton/puppet-rpmforge)

Usage
--------------
To use defaults:

	include memcache

To run multiple instances:

	include memcache

	memcached::config { instance1:
		port	=> 11211,
		memory	=> 64,
	}

	memcached::config { instance2:
		port	=> 11212,
		memory	=> 128,
	}