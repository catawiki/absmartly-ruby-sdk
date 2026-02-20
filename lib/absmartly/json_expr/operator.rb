# frozen_string_literal: true

module Absmartly
  module Operator
    # @interface method
    def evaluate(evaluator, args)
      raise NotImplementedError.new("You must implement evaluate method.")
    end
  end
end
