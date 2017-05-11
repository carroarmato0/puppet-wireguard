# Class wireguard
class wireguard (
  $manage_repo = $::wireguard::params::manage_repo,
) inherits wireguard::params {

  include wireguard::repo

}
