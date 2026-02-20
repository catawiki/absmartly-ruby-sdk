# frozen_string_literal: true

module Absmartly
  class ContextEventLoggerCallback < ContextEventLogger
    attr_accessor :callable

    def initialize(callable)
      @callable = callable
    end

    def handle_event(event, data)
      @callable.call(event, data) if @callable.present?
    end
  end
end
