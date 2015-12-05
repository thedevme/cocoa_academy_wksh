class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
  end

  private

  def product_params
    params.require(:product).permit(:title, :subtitle, :description, :sku, :price, :product_image, :details)
  end

  def find_product
    @product = Product.find(params[:id])
  end

end
