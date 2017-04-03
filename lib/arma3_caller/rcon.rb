module Arma3Caller
  class Rcon

    require 'zlib'
    include Connection

    def initialize(a_address, a_port = 2305)
      super
    end

    def canConnect?(password)
      login(password)
    end

    private

    def login(password)
      data = "\xff\x00" + password

      command = RC_O_login_protocol.new(:header_be => "\x42\x45", :thebegin => "\xff\x00", :password => password, :header_checksum => Zlib.crc32(data))
      resp = self.ask(command.to_binary_s)

      if resp == nil
        return nil
      end

      auth_resp = RC_I_login_protocol.read(resp[0]).authResp

      if auth_resp === "\x01"
        return true
      elsif auth_resp === "\x00"
        false
      else
        return nil
      end
    end

  end
end
