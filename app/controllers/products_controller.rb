class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
      @products = Product.all
      @lead = Lead.new
      # cookies.delete(:saved_lead)
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
    params.require(:product).permit(:title, :subtitle, :description, :sku, :price, :product_image, :details, :slug, :product_thumb_image, :location, :city, :date, :location_image, :location_address, :email_image)
  end

  def find_product
    @product = Product.find_by_slug(params[:id])
  end

end
