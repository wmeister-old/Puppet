class apache2 {
	file { '/var/www/index.html':
		ensure => absent
	}
	file { '/etc/apache2/apache2.conf':
		source => 'puppet:///files/config/apache2/apache2.conf',
		mode => 644
	}
	file { '/etc/apache2/httpd.conf':
		source => 'puppet:///files/config/apache2/httpd.conf',
		mode => 644
	}
	service { 'apache2':
		enable => true,
		ensure => running,
		hasrestart => true,
		hasstatus => true,
		subscribe => File['/etc/apache2/apache2.conf'],
		require => [File['/etc/apache2/httpd.conf'], File['/var/www/index.html']]
	}
	package { 'apache2-mpm-itk':
		ensure => present,
		require => Package[apache2]
	}
	package { 'apache2':
		ensure => present
	}
}

