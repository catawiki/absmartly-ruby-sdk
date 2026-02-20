# frozen_string_literal: true

module Absmartly
  class ContextEventSerializer
    # @interface method
    def serialize(publish_event)
      raise NotImplementedError.new("You must implement serialize method.")
    end
  end
end
