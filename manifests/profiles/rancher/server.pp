class pve::profiles::rancher::server {
  package { 'docker':
    ensure => 'installed',
  }

  class { 'rancher::server': }

  $tags = [$::environment,
    "traefik.tags=${::environment}",
    "traefik.frontend.rule=Host:rancher.dragon.lan,rancher",
    "traefik.frontend.passHostHeader=true"
  ]

  ::consul::service { "${::hostname}-rancher":
    service_name => "rancher",
    address      => $::ipaddress_eth0,
    port         => 8080,
    tags         => $tags
  }
}