class ProductsController < ApplicationController
  allow_unauthenticated_access only: [:index, :show]
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create 
    @product = Product.new(product_params)

    if @product.save
      redirect_to product_path(@product), status: :see_other
    else
      render :new, status: :unprocessable_content
    end
  end

  def edit
  end

  def update

    if @product.update(product_params)
      redirect_to product_path(@product), status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @product.destroy!

    redirect_to products_path, status: :see_other
  end

  private

  def product_params
    params.expect(product: [:name, :price_cents, :image])
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def require_admin
    return if Current.user&.admin?

    render plain: "Only admins can manage products.",
          status: :forbidden
  end
end
