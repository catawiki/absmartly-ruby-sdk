# frozen_string_literal: true

module Absmartly
  class ContextDataProvider
    # @interface method
    def context_data
      raise NotImplementedError.new("You must implement context_data method.")
    end
  end
end
