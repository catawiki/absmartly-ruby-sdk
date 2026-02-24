# frozen_string_literal: true

require_relative "boolean_combinator"

module Absmartly
  class AndCombinator
    include BooleanCombinator

    def combine(evaluator, exprs)
      Array.wrap(exprs).each do |expr|
        return false unless evaluator.boolean_convert(evaluator.evaluate(expr))
      end
      true
    end
  end
end
