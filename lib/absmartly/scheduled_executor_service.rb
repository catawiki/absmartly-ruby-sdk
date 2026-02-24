# frozen_string_literal: true

module Absmartly
  class ScheduledExecutorService
    # @interface method
    def schedule(command, delay, unit)
      raise NotImplementedError.new("You must implement schedule method.")
    end
  end
end
