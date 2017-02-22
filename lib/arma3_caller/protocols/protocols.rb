require 'bindata'

require "arma3_caller/protocols/rules_protocol"

module Arma3Caller




  class A2S_INFO_protocol < BinData::Record
    string  length: 4
    string :header , length: 1
    int8le :protocol_version,  length: 1
    stringz :server_name
    stringz :server_map
    stringz :server_game
    stringz :server_description
    uint16le :server_api
    uint8 :players_connected
    uint8 :max_players
    uint8 :bots_ingame
    string :server_type, length: 1
    string :server_environment, length: 1
    uint8 :server_visibility
    uint8 :server_vac
    stringz :server_version
  end

  class A2S_PLAYER_protocol < BinData::Record
    string  length: 4
    string :header , length: 1
    uint8 :players_count
    array :players, initial_length: :players_count do
      uint8
      stringz :name
      int32le :score
      float_le :duration
    end
  end


end