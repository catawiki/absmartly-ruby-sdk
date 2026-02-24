# frozen_string_literal: true

require "absmartly/default_audience_deserializer"
require "absmartly/context"
require "absmartly/client"
require "absmartly/json/publish_event"

RSpec.describe Absmartly::DefaultAudienceDeserializer do
  it ".deserialize" do
    deser = described_class.new
    audience = "{\"filter\":[{\"gte\":[{\"var\":\"age\"},{\"value\":20}]}]}"

    expected = { "filter": [{ "gte": [{ "var": "age" }, { "value": 20 }] }] }
    actual = deser.deserialize(audience, 0, audience.length)
    expect(actual).to eq(expected)
  end

  it ".deserialize does not throw" do
    deser = described_class.new
    audience = "{\"filter\":[{\"gte\":[{\"var\":\"age\"},{\"value\":20}]}]}"
    expect(deser.deserialize(audience, 0, 14)).to be_nil
  end
end
