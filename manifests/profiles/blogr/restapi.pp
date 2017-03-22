class pve::profiles::blogr::restapi{

  file{"/opt/blogr":
    ensure  =>  directory,
  }
  exec {"chown blogr":
    require => [File['/opt/blogr'], User['jenkins']],
    command => "/bin/chown -R jenkins.jenkins /opt/blogr",
  }
  class { 'nodejs':
    version      => 'latest',
    make_install => false
  }
  file { '/etc/init.d/node-app':
    source => 'puppet:///modules/pve/app/etc/init.d/node-app',
    notify => Service['node-app'],
    mode => "755"
  }
  service { 'node-app':
    ensure  => running,
    enable  => true,
    require => [File['/etc/init.d/node-app']]
  }



  $tags = $hostname ? {
    /(t-\.)/ => ['test'],
    /(p-\.)/ => ['prod'],
    default  => []
  }

  ::consul::service { "${::hostname}-app":
    service_name => "app",
    address      => "${::ipaddress}",
    port         => 3000,
    tags          => $tags
  }

}