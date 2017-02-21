require 'bindata'

module Arma3Caller

  class A2S_INFO_protocol < BinData::Record
    string  length: 4
    string :header , length: 1
    string  length: 1
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

  class A2S_RULES_protocol < BinData::Record
    string  length: 4
    string :header , length: 1
    string :test, length: 100


    bit8 :rules_protocol_version
    bit8 :overflow
    bit8 :dlc_bit
    bit8 :reserved
    bit3 :difficulty_level
    bit3 :difficulty_ai
    bit1 :advanced_flight_mode
    bit1 :t3rd_person
    bit1 :crosshair
    bit7




  end

end