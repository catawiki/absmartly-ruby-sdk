# frozen_string_literal: true

require_relative "./unary_operator"

module Absmartly
  class NilOperator
    include UnaryOperator

    def unary(evaluator, arg)
      arg.nil?
    end
  end
end
