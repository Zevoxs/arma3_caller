require 'socket'

module Arma3Caller
  module Connection

    TIME_OUT = 3

    def initialize (a_address, a_port = 2302)
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
      resp = if select([@socket], nil, nil, TIME_OUT)
               @socket.recvfrom(1400)
             end
    end

  end
end