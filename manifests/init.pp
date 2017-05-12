# Class wireguard
class wireguard (
  $manage_repo   = $::wireguard::params::manage_repo,
  $manage_epel   = $::wireguard::params::manage_epel,
  $manage_elrepo = $::wireguard::params::manage_elrepo,
  $manage_kmod   = $::wireguard::params::manage_kmod,
) inherits wireguard::params {

  contain wireguard::repo
  contain wireguard::install

  Class['wireguard::repo']->Class['wireguard::install']

}
