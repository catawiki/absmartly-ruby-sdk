# frozen_string_literal: true

module Absmartly
  class VariableParser
    # @interface method
    def parse
      raise NotImplementedError.new("You must implement parse method.")
    end
  end
end
