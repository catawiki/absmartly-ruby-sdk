# frozen_string_literal: true

require_relative "./unary_operator"

module Absmartly
  class NotOperator
    include UnaryOperator

    def unary(evaluator, args)
      !evaluator.boolean_convert(args)
    end
  end
end
