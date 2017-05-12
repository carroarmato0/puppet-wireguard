# lib/puppet/type/interface.rb
Puppet::Type.newtype(:wireguard_interface) do
  desc = "Create a wireguard interface."

  ensurable do
    defaultvalues
    defaultto :present
  end

  newparam(:name, :namevar => true) do
    desc "The name of the interface."
    munge do |value|
      value.downcase
    end
    def insync?(is)
      is.downcase == should.downcase
    end
  end

end
