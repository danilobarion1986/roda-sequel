# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Models::Beneficio do
  describe '.all' do
    it 'retorna um array de objetos Models::Beneficio' do
      retorno = described_class.all

      expect(retorno).not_to be_empty
      expect(retorno.all? do |beneficio|
        beneficio.is_a?(described_class)
      end).to be true
    end
  end
end
