# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ActiveService::Response do
  describe '#initialize' do
    subject do
      described_class.new(foo: 'bar', bar: 'baz', errors: 'foo bar', messages: 'baz')
    end

    it 'returns objects' do
      expect(subject.foo).to eql('bar')
      expect(subject.bar).to eql('baz')
      expect(subject.errors).to include('foo bar')
      expect(subject.messages).to include('baz')

      expect { subject.tmp }.to raise_error NoMethodError
    end

    context 'when instantiating multiple active service responses' do
      it 'doesnt affect each other attributes' do
        first_response = described_class.new(data: 1, errors: 'someError', messages: 'someMessages')
        second_response = described_class.new(
          data: { a: 1 },
          errors: %w[anotherError],
          messages: %w[anotherMessage someOtherMessage]
        )

        expect(second_response.data).to match(a: 1)
        expect(first_response.data).to eq(1)

        expect(first_response.errors).to match_array(%w[someError])
        expect(second_response.errors).to match_array(%w[anotherError])

        expect(second_response.messages).to match_array(%w[anotherMessage someOtherMessage])
        expect(first_response.messages).to match_array(%w[someMessages])
      end
    end
  end

  describe '#valid?' do
    context 'when success' do
      subject { described_class.new.valid? }

      it 'returns true when it is valid?' do
        is_expected.to be true
      end
    end

    context 'when failure' do
      subject { described_class.new(errors: 'message').valid? }

      it 'returns false when it is not valid?' do
        is_expected.to be false
      end
    end
  end
end
