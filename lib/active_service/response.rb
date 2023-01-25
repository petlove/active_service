# frozen_string_literal: true

module ActiveService
  class Response
    def initialize(data = {})
      @tmp = data

      handle_errors_and_messages
      define_accessors
    end

    def valid?
      errors.empty?
    end

    def errors
      @errors ||= []
    end

    def messages
      @messages ||= []
    end

    private

    def handle_errors_and_messages
      tmp.each_pair do |key, value|
        case key.to_s
        when 'errors'
          @errors = [value].flatten.compact
        when 'messages'
          @messages = [value].flatten.compact
        end
      end
    end

    def define_accessors
      tmp.each do |key, _|
        next if respond_to?(key.to_sym)

        define_singleton_method(key) do
          tmp[key.to_sym]
        end
      end
    end

    attr_reader :tmp
  end
end
