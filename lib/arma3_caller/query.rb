module Arma3Caller
  class Query

    include Connection

    def initialize(a_address, a_port = 2302)
      super
    end

    def server_info
      command = "\xFF\xFF\xFF\xFFTSource Engine Query\x00"
      resp = self.ask(command)
      a = A2S_INFO_protocol.read(resp[0])
      return a


    end
  end
end