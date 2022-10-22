class ProductsController < ApplicationController
  before_action :set_product, only: [ :show, :edit, :update, :destroy ]
  def new
    @product = Product.new
    @businesses = Business.all
  end

  def show
    @products = Product.all
    @businesses = Business.all
  end

  def create
    @businesses = Business.all
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: "Product was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @businesses = Business.all
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def index
    @products = Product.all
  end

  def destroy
    @product.destroy
    redirect_to products_path, status: :see_other, notice: "Product was successfully destroyed." 
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:image, :name, :price, :presentation, :featured, :business_id)
    end
end
