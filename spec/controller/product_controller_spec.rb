# frozen_string_literal: true
require 'rails_helper'

describe ProductsController, type: :controller do

  describe 'GET products#index' do
    it 'Get# displays products of user' do
      product = FactoryBot.create(:product)
      get :index
      expect(assigns(:products)).to eq([product])
    end
  end

  # show action
  describe 'GET# products#show' do
    before do
      get :show, params: { id: product.id }
    end

    it 'show the products details' do
      expect(response.status).to eq(200)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      product = FactoryBot.create(:product)
      byebug
      get product_path(product)
      expect(response).to be_successful
    end
  end

  # update action
  describe 'PATCH #update' do
    it 'updates the product' do
      patch :update, params: { id: product.id, price: '20' }
      expect(response.status).to eq(200)
    end

    it 'does not change the product, and re-renders the form' do
      patch :update, params: { id: product.id, price: nil }
      expect(Product.count).to eq(1)
    end

  end

  # total_price action
  describe 'GET #total_price' do
    let(:product) { FactoryBot.create(:product) }
    let(:product1) { FactoryBot.create(:product, code: 'TSHIRT', name: 'polo', price: 15) }
    let(:product2) { FactoryBot.create(:product, code: 'HODDIE', name: 'hm', price: 20) }
    item = %w[MUG TSHIRT HODDIE]

    it 'is expected to check item count' do
      get :total_price, params: { items: item, Product: [product, product1, product2] }
      expect(response.status).to eq(200)
    end
  end
end
