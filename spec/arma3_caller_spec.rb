require "spec_helper"

describe Arma3Caller do
  it "has a version number" do
    expect(Arma3Caller::VERSION).not_to be nil
  end

  myServer =  "213.32.6.62"
  myPort = 2303
  it "Use this data" do
    puts "[CONFIG] IP_ADDRESS = #{myServer}"
    puts "[CONFIG] PORT = #{myPort}"
  end

  it "SERVER_INFO request with QUERY class" do
    a = Arma3Caller::Query.new(myServer, myPort)
    puts "Make request ... "
    a.open
    puts a.server_info
  end


  it "CHALLENGE_NUMBER request with QUERY class" do
    a = Arma3Caller::Query.new(myServer, myPort)
    puts "Make request ... "
    a.open
    puts a.server_players
  end

end
