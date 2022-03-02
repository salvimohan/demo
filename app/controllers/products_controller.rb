# frozen_string_literal: true

class ProductsController < ApplicationController
  #http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  include ProductModule
  def index
    @products = Product.all
    render json: @products
  end

  def show
    @product = Product.find(params[:id])
    render json: @product
  end

  def update
    @product = Product.find(params[:id])
    @product.update(price: params[:price])
    render json: @product
  end

  def total_price
    render json: discount(params[:items])
  end
end
