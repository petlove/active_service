# frozen_string_literal: true

require 'simplecov'

module SimpleCovConfig
  def self.configure
    SimpleCov.minimum_coverage 60
    SimpleCov.start do
      add_filter { |source_file| cover?(source_file.lines) }
      add_filter '/spec/'
    end
  end

  def self.cover?(lines)
    !lines.detect { |line| line.src.match?(/(def |attributes)/) }
  end
end
