# class wireguard::install
class wireguard::install {

  package { $::wireguard::params::packages:
    ensure => installed,
    before => Kmod::Load['wireguard'],
  }

  if $wireguard::manage_kmod {
    kmod::load { 'wireguard': }
  }

}
