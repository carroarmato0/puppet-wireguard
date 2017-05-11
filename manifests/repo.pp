# class wireguard::repo
class wireguard::repo {

  if $wireguard::manage_repo {

    $osfamily_downcase = downcase($::osfamily)

    if defined("::wireguard::repo::${osfamily_downcase}") {
      include "::wireguard::repo::${osfamily_downcase}"
    } else {
      notify{"You have asked to manage_repo on a system that doesn't have a repo class specified: ${::osfamily}":}
    }

  }

}
