module Arma3Caller
  class Query

    include Connection

    def initialize(a_address, a_port = 2302)
      super
    end

    def server_info
      command = "\xFF\xFF\xFF\xFFTSource Engine Query\x00"
      resp = self.ask(command)
      info = A2S_INFO_protocol.read(resp[0])
        return info
    end

    def server_players
      command = make_commandwchallenge("\x55")
      resp = self.ask(command)
      data = A2S_PLAYER_protocol.read(resp[0])
      return data
    end

    def server_rules
      command = make_commandwchallenge("\x56")
      resp = self.ask(command)
      modif = resp[0].gsub("\x01\x01", "\x01").gsub("\x01\x02","\x00").gsub( "\x01\x03", "\xFF")
      puts modif.inspect
      data = A2S_RULES_protocol.read(modif)
      puts data
      return data
    end

    private

    def get_challenge(_type)
      pack_array = ["\xFF\xFF\xFF\xFF", _type, "\xFF\xFF\xFF\xFF" ]
      command = pack_array.pack('a4aa4')
      resp = self.ask(command)
      data = resp[0].unpack('@4aa*')
      return data[1]
    end

    def make_commandwchallenge(_command)
      pack_array = ["\xFF\xFF\xFF\xFF",_command, get_challenge(_command)]
      command = pack_array.pack('a4aa4')
      return command
    end

  end
end