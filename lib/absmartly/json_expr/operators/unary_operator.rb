# frozen_string_literal: true

module Absmartly
  module UnaryOperator
    def evaluate(evaluator, args)
      arg = evaluator.evaluate(args)
      unary(evaluator, arg)
    end

    # @abstract method
    def unary(evaluator, arg)
      raise NotImplementedError.new("You must implement unary method.")
    end
  end
end
