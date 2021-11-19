# frozen_string_literal: true

module ActiveService
  class Base
    def initialize(*args); end

    def perform
      raise NotImplementedError, "#{self.class.name} must implement method #perform"
    end

    def response(*data)
      @response ||= Response.new(*data)
    end

    class << self
      def perform(*args)
        new(*args).perform
      rescue StandardError => e
        data = {
          errors: e.message,
          error_class: e.class.name
        }
        data[:error_backtrace] = e.backtrace if e.backtrace

        Response.new(data)
      end

      def perform!(*args)
        new(*args).perform
      end
    end
  end
end
