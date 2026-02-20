# frozen_string_literal: true

require_relative "binary_operator"

module Absmartly
  class LessThanOperator
    include BinaryOperator

    def binary(evaluator, lhs, rhs)
      result = evaluator.compare(lhs, rhs)
      !result.nil? ? (result < 0) : nil
    end
  end
end
