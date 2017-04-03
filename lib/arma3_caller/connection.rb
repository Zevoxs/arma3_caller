require 'socket'

module Arma3Caller
  module Connection

    TIME_OUT = 1

    def initialize (a_address, a_port)
      @ip = a_address
      @port = a_port
    end

    def open
      @socket = UDPSocket.open
    end

    def close
      @socket.close
    end

    def ask(a_cmd)
      @socket.send(a_cmd,0,@ip,@port)
      if select([@socket], nil, nil, TIME_OUT)
        return @socket.recvfrom(6000)
      else
        return nil
      end
    end
  end
end