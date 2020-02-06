# frozen_string_literal: true

require 'active_service/version'

module ActiveService
  class Error < StandardError; end

  require 'active_service/base'
  require 'active_service/response'
end
