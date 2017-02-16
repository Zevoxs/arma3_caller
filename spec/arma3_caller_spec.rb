require "spec_helper"

describe Arma3Caller do
  it "has a version number" do
    expect(Arma3Caller::VERSION).not_to be nil
  end

  it "Do a request..." do
    a = Arma3Caller::Query.new("164.132.203.27", 2303)
    a.open
    a.server_info
  end
end
