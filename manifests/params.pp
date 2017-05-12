# Class wireguard::params
class wireguard::params {

  $manage_repo   = true
  $manage_epel   = true
  $manage_elrepo = true
  $manage_kmod   = true

  $osfamily_downcase = downcase($::osfamily)

  case $osfamily_downcase {
    'redhat': {
      $packages = [
        'kernel-lt',
        'kernel-lt-headers',
        'kernel-lt-devel',
        'wireguard-dkms',
        'wireguard-tools',
        'make',
      ]
    }
    default: {
      fail("${::osfamily} is not supported.")
    }
  }

}
