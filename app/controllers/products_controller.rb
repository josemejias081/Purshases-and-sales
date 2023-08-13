class ProductsController < ApplicationController
  load_and_authorize_resource
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  def new
    @users = User.all 
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
      render :new, status: :unprocessable_entity, alert: "Product was not successfully created"
    end
  end

  def edit
    @users = User.all
    @businesses = Business.all
    @products = Product.all
  end

  def update
    @users = User.all
    @businesses = Business.all
    @products = Product.all

    if @product.update(product_params)
      redirect_to @product, notice: "Product was successfully updated."
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
      params.require(:product).permit(:image, :name, :price, :presentation, :featured, :business_id, :user_id)
    end
end
