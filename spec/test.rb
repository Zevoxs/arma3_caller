$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require 'arma3_caller'

a = Arma3Caller::Query.new("164.132.203.27", 2302)
a.open
a.server_info