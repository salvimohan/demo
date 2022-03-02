# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ProductModule, :type => :helper  do
  describe '#discount' do
    
    before(:each) do
      FactoryBot.create(:product)
      FactoryBot.create(:product, code: 'TSHIRT', name: 'polo', price: 15)
      FactoryBot.create(:product, code: 'HOODIE', name: 'hm', price: 20)
    end

    it 'is expected to check item count to be eq 41' do
      items = %w[MUG TSHIRT HODDIE]
      expect(helper.discount(items)).to eq(41)
    end

    it 'is expected to check item count to be eq 21' do
      items = %w[MUG TSHIRT MUG]
      expect(helper.discount(items)).to eq(21)
    end

    it 'is expected to check item count to be eq 27' do
      items = %w[MUG TSHIRT MUG MUG]
      expect(helper.discount(items)).to eq(27)
    end

    it 'is expected to check item count to be eq 33' do
      items = %w[MUG TSHIRT MUG MUG MUG]
      expect(helper.discount(items)).to eq(33)
    end

    it 'is expected to check item count to be eq 68' do
      items = %w[MUG TSHIRT TSHIRT TSHIRT TSHIRT MUG HOODIE]
      expect(helper.discount(items)).to eq(68)
    end
  end

end
