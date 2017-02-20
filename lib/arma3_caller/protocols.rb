require 'bindata'

module Arma3Caller

  class A2S_INFO_protocol < BinData::Record
    string  length: 6
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

end