class PagesController < ApplicationController

  def home
    @products = Product.all
  end

  def show
  end

  def pong
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
