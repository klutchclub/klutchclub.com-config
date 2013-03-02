#group { 'puppet': ensure => 'present' }

class { 'nginx': }


nginx::resource::vhost { 'www.klutchclub.com':
	ensure   => present,
	www_root => '/var/www/www.klutchclub.com',
}

package {'php5-fpm':
	ensure => present,
}

file {'/etc/nginx/conf.d/php-fastcgi.conf':
	ensure => present,
	source => 'puppet:///modules/kc-nginx/php-fastcgi.conf',
	notify => Class['nginx::service'],
}

service {'php5-fpm':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
}

# Default server, with a typical minimal virtualhost and ready for PHP-FPM
# nginx::file { 'www.klutchclub.com.conf':
# 	content => template('kc-nginx/www.klutchclub.com.conf.erb'),
# }
# # Use the included example FastCGI for PHP configuration
# nginx::file { 'php.conf.inc':
# 	source => 'puppet:///modules/nginx/php.conf.inc',
# }
# 
# file { '/var/www':
# 	ensure => 'directory',
# 	owner => 'nginx',
# 	mode => '755'
# }
# 
# file { '/var/www/www.klutchclub.com':
# 	ensure => 'directory',
# 	owner => 'nginx',
# 	mode => '755'
# }

#nginx::php { 'php': }

#nginx::vhost { 'www.klutchclub.com':
#  vhostroot => "/var/www/www.klutchclub.com",
#  port      => 80,
#}

