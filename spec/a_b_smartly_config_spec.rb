# frozen_string_literal: true

require "absmartly/context_data_provider"
require "absmartly/a_b_smartly_config"
require "absmartly/context_event_handler"
require "absmartly/variable_parser"
require "absmartly/context_event_logger"
require "absmartly/scheduled_executor_service"
require "absmartly/client"

RSpec.describe Absmartly::ABSmartlyConfig do
  it ".context_data_provider" do
    provider = Absmartly::ContextDataProvider.new
    config = described_class.create
    config.context_data_provider = provider
    expect(provider).to eq(config.context_data_provider)
  end

  it ".context_event_handler" do
    handler = Absmartly::ContextEventHandler.new
    config = described_class.create
    config.context_event_handler = handler
    expect(handler).to eq(config.context_event_handler)
  end

  it ".variable_parser" do
    variable_parser = Absmartly::VariableParser.new
    config = described_class.create
    config.variable_parser = variable_parser
    expect(variable_parser).to eq(config.variable_parser)
  end

  it ".scheduler" do
    scheduler = Absmartly::VariableParser.new
    config = described_class.create
    config.scheduler = scheduler
    expect(scheduler).to eq(config.scheduler)
  end

  it ".context_event_logger" do
    logger = Absmartly::ContextEventLogger.new
    config = described_class.create
    config.context_event_logger = logger
    expect(logger).to eq(config.context_event_logger)
  end

  it "set all" do
    handler = Absmartly::ContextEventHandler.new
    provider = Absmartly::ContextDataProvider.new
    parser = Absmartly::VariableParser.new
    scheduler = Absmartly::ScheduledExecutorService.new
    client = instance_double(Absmartly::Client)
    config = described_class.create
    config.variable_parser = parser
    config.context_data_provider = provider
    config.context_event_handler = handler
    config.scheduler = scheduler
    config.client = client
    expect(provider).to eq(config.context_data_provider)
    expect(handler).to eq(config.context_event_handler)
    expect(parser).to eq(config.variable_parser)
    expect(scheduler).to eq(config.scheduler)
    expect(client).to eq(config.client)
  end
end
