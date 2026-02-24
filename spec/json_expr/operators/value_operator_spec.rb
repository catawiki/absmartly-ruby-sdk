# frozen_string_literal: true

require_relative "./shared_operator"
require "absmartly/json_expr/operators/value_operator"

RSpec.describe Absmartly::ValueOperator do
  include_examples "shared operator"

  let(:operator) { described_class.new }
  describe ".evaluate" do
    it "test evaluate" do
      expect(operator.evaluate(evaluator,  0)).to eq(0)
      expect(operator.evaluate(evaluator,  1)).to eq(1)
      expect(operator.evaluate(evaluator,  true)).to eq(true)
      expect(operator.evaluate(evaluator,  false)).to eq(false)
      expect(operator.evaluate(evaluator,  "")).to eq("")
      expect(operator.evaluate(evaluator,  Absmartly::EMPTY_MAP)).to eq(Absmartly::EMPTY_MAP)
      expect(operator.evaluate(evaluator,  Absmartly::EMPTY_LIST)).to eq(Absmartly::EMPTY_LIST)
      expect(operator.evaluate(evaluator,  nil)).to be_nil
      expect(evaluator).to have_received(:evaluate).exactly(0).time
    end
  end
end
