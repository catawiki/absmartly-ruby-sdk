# frozen_string_literal: true

module Absmartly
  class ContextDataDeserializer
    # @interface method
    def deserialize(bytes, offset, length)
      raise NotImplementedError.new("You must implement deserialize method.")
    end
  end
end
