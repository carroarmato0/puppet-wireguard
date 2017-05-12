Puppet::Type.type(:wireguard_interface).provide(:wireguard) do
    desc "Wireguard interface provider"

    commands :ip => "ip"

    def create
        ip "link", "add", "dev", resource[:name], "type", "wireguard"
    end

    def destroy
        ip "link", "delete", "dev", resource[:name], "type", "wireguard"
    end

    def exists?
      ip("link").include? resource[:name]
    end

end
