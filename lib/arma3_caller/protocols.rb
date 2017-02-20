require 'bindata'

module Arma3Caller

  class A2S_INFO_protocol < BinData::Record
    string  length: 4
    string :header , length: 1
    string  length: 1
    stringz :serverName
    stringz :serverMap
    stringz :serverGame
    stringz :serverDescription
    uint16le :serverApiId
    uint8 :playersConnected
    uint8 :maxPlayers
    uint8 :botsIG
    string :serverType, length: 1
    string :serverEnvironment, length: 1
    uint8 :serverVisibility
    uint8 :serverVAC
    stringz :serverVersion
  end

  class A2S_PLAYER_protocol < BinData::Record
    string  length: 4
    string :header , length: 1
    uint8 :playersCount
    i = 0
    array :players, initial_length: :playersCount do
      uint8
      stringz :name
      int32le :score
      float_le :duration
    end




  end

end