# frozen_string_literal: true

require_relative "audience_deserializer"

module Absmartly
  class DefaultAudienceDeserializer < AudienceDeserializer
    attr_accessor :log, :reader

    def deserialize(bytes, offset, length)
      JSON.parse(bytes[offset..length], symbolize_names: true)
    rescue JSON::ParserError
      nil
    end
  end
end
