# frozen_string_literal: true

require "absmartly/default_http_client"
require "absmartly/default_http_client_config"

RSpec.describe Absmartly::DefaultHttpClient do
  describe "#initialize" do
    it "configures Faraday with custom pool_size" do
      config = Absmartly::DefaultHttpClientConfig.create
      config.pool_size = 42

      expect_any_instance_of(Faraday::Connection).to receive(:adapter)
        .with(:net_http_persistent, pool_size: 42)
        .and_call_original

      described_class.create(config)
    end

    it "configures Faraday with custom pool_idle_timeout" do
      config = Absmartly::DefaultHttpClientConfig.create
      config.pool_idle_timeout = 15

      block_called = false
      idle_timeout_value = nil

      allow_any_instance_of(Faraday::Connection).to receive(:adapter)
        .with(:net_http_persistent, pool_size: config.pool_size) do |&block|
          http = double("http")
          allow(http).to receive(:idle_timeout=) { |val| idle_timeout_value = val }
          block.call(http) if block
          block_called = true
        end

      described_class.create(config)

      expect(block_called).to be true
      expect(idle_timeout_value).to eq(15)
    end

    it "uses default pool_size of 20" do
      config = Absmartly::DefaultHttpClientConfig.create

      expect_any_instance_of(Faraday::Connection).to receive(:adapter)
        .with(:net_http_persistent, pool_size: 20)
        .and_call_original

      described_class.create(config)
    end

    it "uses default pool_idle_timeout of 5" do
      config = Absmartly::DefaultHttpClientConfig.create

      block_called = false
      idle_timeout_value = nil

      allow_any_instance_of(Faraday::Connection).to receive(:adapter)
        .with(:net_http_persistent, pool_size: 20) do |&block|
          http = double("http")
          allow(http).to receive(:idle_timeout=) { |val| idle_timeout_value = val }
          block.call(http) if block
          block_called = true
        end

      described_class.create(config)

      expect(block_called).to be true
      expect(idle_timeout_value).to eq(5)
    end

    it "uses the net_http_persistent adapter" do
      config = Absmartly::DefaultHttpClientConfig.create
      client = described_class.create(config)
      adapter = client.session.builder.adapter

      expect(adapter.klass).to eq(Faraday::Adapter::NetHttpPersistent)
    end
  end
end
