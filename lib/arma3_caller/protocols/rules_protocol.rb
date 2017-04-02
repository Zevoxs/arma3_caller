require 'bindata'

module Arma3Caller

  class PascalString < BinData::Record
    bit4le  :len,  :value => lambda { data.length }
    bit4le
    string :data, :read_length => :len
  end

  class A2S_RULES_protocol < BinData::Record
    #count_bytes_remaining :bytes_remaining
    string  length: 4
    string :header , length: 1
    uint8le :protocol_version
    uint8le # UNKNOWN ??
    uint8le # UNKNOWN ??
    uint8le # UNKNOWN ??
    uint8le # UNKNOWN ??
    uint8le # UNKNOWN ??

    buffer :dlc_flags, length: 1 do
      bit1le :karts
      bit1le :marksmen
      bit1le :helicopter
      bit1le
      bit1le :expansion
      bit3le
    end

    uint8le # RESERVED

    bit3le :difficulty_level
    bit3le :ai_level
    bit1le :adv_flight_model
    bit1le :person_3rd

    bit1le :weapon_crosshair
    bit7le

    array :hashes, initial_length: lambda { dlc_flags.karts + dlc_flags.marksmen + dlc_flags.helicopter + dlc_flags.expansion } do
     uint32le :thehash
    end

    uint8le :mods_count
    array :mods, initial_length: :mods_count do
      uint32le :mod_hash
      pascal_string :steamID
      uint8le :lent
      string :the___name, :read_length => :lent

    end

    uint8le :signatures_count
    array :signatures, initial_length: :signatures_count do
      uint8le :lent
      string :the___name, :read_length => :lent
    end
  end


  module Connection

    #
    # En deux parties car je ne connais pas encore le nombre de dlc dont il faut trouver le hash
    def process_rules(_data)
      data = _data.gsub("\x01\x02","\x00").gsub( "\x01\x03", "\xFF".force_encoding('ASCII-8BIT')).gsub("\x01\x01", "\x01")
       data = A2S_RULES_protocol.read(data)
      data

    end
  end
end