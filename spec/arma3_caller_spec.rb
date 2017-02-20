require "spec_helper"

describe Arma3Caller do
  it "has a version number" do
    expect(Arma3Caller::VERSION).not_to be nil
  end

  it "SERVER_INFO request with QUERY class" do
    a = Arma3Caller::Query.new("213.32.6.146", 2303)
    puts "Make request with IP => 213.32.6.146 AND port => 2303 "
    a.open
    a.server_info
  end
end
