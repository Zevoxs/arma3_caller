require "spec_helper"


describe Arma3Caller do
  it "has a version number" do
    expect(Arma3Caller::VERSION).not_to be nil
  end

  my_server =  "217.198.137.196"
  my_port = 2303 #233
  it "Use this data" do
    puts "[CONFIG] IP_ADDRESS = #{my_server}"
    puts "[CONFIG] PORT = #{my_port}"
  end

  it "SERVER_INFO request with QUERY class" do
    a = Arma3Caller::Query.new(my_server, my_port)
    puts "Make request ... "
    a.open
    expect(a.server_info).not_to be nil
    puts a.server_info
    a.close
    puts 3368176641.to_s(16)
  end

  it "PLAYER_LIST request with QUERY class" do
    a = Arma3Caller::Query.new(my_server, my_port)
    a.open
    expect(a.server_players).not_to be nil
    a.close
  end

  it "SERVER_RULES request with QUERY class" do
    a = Arma3Caller::Query.new(my_server, my_port)
    a.open

    a.server_rules

    a.close
  end


  it "RCON LOGIN request with RCON class" do
    a = Arma3Caller::Rcon.new("217.198.137.196", 2305)
    a.open

    puts a.canConnect?("UMtT30uz")


    a.close

  end
end
