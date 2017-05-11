#
class wireguard::repo::redhat {

  yumrepo { 'jdoss-wireguard':
    ensure              => present,
    enabled             => '1',
    descr               => 'Copr repo for wireguard owned by jdoss',
    baseurl             => 'https://copr-be.cloud.fedoraproject.org/results/jdoss/wireguard/epel-7-$basearch/',
    gpgkey              => 'https://copr-be.cloud.fedoraproject.org/results/jdoss/wireguard/pubkey.gpg',
    skip_if_unavailable => true,
  }

}
