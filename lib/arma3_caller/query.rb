module Arma3Caller
  class Query

    include Connection

    def initialize(a_address, a_port = 2302)
      super
    end

    def server_info
      command = "\xFF\xFF\xFF\xFFTSource Engine Query\x00"
      resp = self.ask(command)
      puts resp.inspect
    end
  end
end