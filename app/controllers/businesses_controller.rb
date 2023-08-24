class BusinessesController < ApplicationController
  skip_authorization_check only: [:index, :show]
  before_action :set_business, only: [ :show, :edit, :update, :destroy ]

  def index   
    @businesses = Business.all.order("created_at DESC")
  end
 
  def show
    @product = Product.new
    @products = Product.all
    @businesses = Business.all
  end
  
  def new
    @products = Product.all
    @business = Business.new
  end

  def edit
    @products = Product.all
    
  end

  def create
    @product = Product.new(business_id: @business_id)
    @user = User.all
    @products = Product.all
    @categories = Category.all
    @products = Product.limit(4)
    @business = Business.new(business_params)
    if @business.save
      redirect_to @business, notice: "Business was successfully created." 
    else
      @user = User.all

      render :new, status: :unprocessable_entity 
    end
  end

  def update
    @user = User.all
    @products = Product.all
    @businesses = Business.all
    if @business.update(business_params)
      redirect_to @business, notice: "Business was successfully updated." 
    else
      render "edit", status: :unprocessable_entity 
    end
  end

  def destroy
    @business.destroy
    redirect_to businesses_path, status: :see_other, notice: "Business was successfully destroyed." 
  end

  private
    def set_business
      @business = Business.find(params[:id])
    end

    def business_params
      params.require(:business).permit(:name, :rif, :address, :phone, :email, :ig, :fb, :location, :logo, :cover, :featured, :description, :category_id, :user_id, product_ids: [])
    end
end
