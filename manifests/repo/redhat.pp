#
class wireguard::repo::redhat {

  if $wireguard::manage_epel {
    include ::epel
  }

  Yumrepo {
    notify              => Exec['yum-clean-expire-cache'],
    skip_if_unavailable => true,
  }

  if $::operatingsystemmajrelease == 7 {
    yumrepo { 'jdoss-wireguard':
      ensure  => present,
      enabled => '1',
      descr   => 'Copr repo for wireguard owned by jdoss',
      baseurl => 'https://copr-be.cloud.fedoraproject.org/results/jdoss/wireguard/epel-7-$basearch/',
      gpgkey  => 'https://copr-be.cloud.fedoraproject.org/results/jdoss/wireguard/pubkey.gpg',
    }

    if $wireguard::manage_elrepo {
      yumrepo { 'elrepo':
        baseurl    => 'http://elrepo.org/linux/elrepo/el7/$basearch/',
        descr      => 'ELRepo.org Community Enterprise Linux Repository - el7',
        enabled    => '1',
        gpgkey     => 'https://www.elrepo.org/RPM-GPG-KEY-elrepo.org',
        mirrorlist => 'http://mirrors.elrepo.org/mirrors-elrepo.el7',
      }
      yumrepo { 'elrepo-kernel':
        baseurl    => 'http://elrepo.org/linux/kernel/el7/$basearch/',
        descr      => 'ELRepo.org Community Enterprise Linux Kernel Repository - el7',
        enabled    => '1',
        gpgkey     => 'https://www.elrepo.org/RPM-GPG-KEY-elrepo.org',
        mirrorlist => 'http://mirrors.elrepo.org/mirrors-elrepo-kernel.el7',
      }
      yumrepo { 'elrepo-extras':
        baseurl    => 'http://elrepo.org/linux/extras/el7/$basearch/',
        descr      => 'ELRepo.org Community Enterprise Linux Extras Repository - el7',
        enabled    => '1',
        gpgkey     => 'https://www.elrepo.org/RPM-GPG-KEY-elrepo.org',
        mirrorlist => 'http://mirrors.elrepo.org/mirrors-elrepo-extras.el7',
      }
    }
  }

  exec { 'yum-clean-expire-cache':
    user        => 'root',
    path        => '/usr/bin',
    refreshonly => true,
    command     => 'yum clean expire-cache',
  }

  Class['epel']->Yumrepo['jdoss-wireguard']->Yumrepo['elrepo']->Yumrepo['elrepo-kernel']->Yumrepo['elrepo-extras']

}
