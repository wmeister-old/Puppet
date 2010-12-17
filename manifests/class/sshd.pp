class sshd {
	file { '/etc/ssh/sshd_config':
		source => 'puppet:///files/config/sshd/sshd_config',
		mode => 644
	}
	package { 'openssh-server':
		ensure => present,
		subscribe => File['/etc/ssh/sshd_config']
	}
}

