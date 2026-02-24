# frozen_string_literal: true

require_relative "boolean_combinator"

module Absmartly
  class OrCombinator
    include BooleanCombinator

    def combine(evaluator, exprs)
      Array.wrap(exprs).each do |expr|
        return true if evaluator.boolean_convert(evaluator.evaluate(expr))
      end
      Array.wrap(exprs).empty?
    end
  end
end
