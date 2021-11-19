# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ActiveService::Base do
  let(:response) { double(:reponse) }

  describe '.response' do
    subject { described_class.new.response }

    it 'returns an ActiveService::Response' do
      is_expected.to be_a(ActiveService::Response)
    end
  end

  describe '#perform' do
    context 'when it calls initialize' do
      subject { described_class.new.perform }

      it 'returns not implemented error' do
        expect { subject }.to raise_error(NotImplementedError) do |error|
          expect(error.message).to include('ActiveService::Base must implement method #perform')
        end
      end
    end

    context 'when calls perform with hash' do
      let(:params) { { foo: 'bar', bar: 'baz' } }

      subject { described_class.perform(params) }
      after   { subject }

      it 'returns the expected result' do
        expect(described_class).to receive(:new).once.with(params).and_return(response)
        expect(response).to receive(:perform)
      end
    end

    context 'when calls perform with an object' do
      let(:user) { double(:user) }

      subject { described_class.perform(user) }
      after   { subject }

      it 'returns the expected result' do
        expect(described_class).to receive(:new).once.with(user).and_return(response)
        expect(response).to receive(:perform)
      end
    end

    context 'when exception is risen' do
      before { allow(ActiveService::Base).to receive(:new).and_raise(ArgumentError) }

      subject { described_class.perform }

      it 'returns a ActiveService::Response' do
        is_expected.to be_a(ActiveService::Response)
      end

      it 'response is not valid' do
        expect(subject.valid?).to be false
      end

      it "exposes the exception's class name" do
        expect(subject.error_class).to eq 'ArgumentError'
      end

      it "exposes the exception's backtrace" do
        expect(subject.error_backtrace).not_to be_empty
      end
    end
  end

  describe '#perform!' do
    context 'when calls perform with an object' do
      subject { described_class.perform! }
      after   { subject }

      it 'returns the expected result' do
        expect(described_class).to receive(:new).once.and_return(response)
        expect(response).to receive(:perform)
      end
    end
  end
end
