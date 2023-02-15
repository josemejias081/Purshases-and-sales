class BusinessesController < ApplicationController
  load_and_authorize_resource
  before_action :set_business, only: [ :show, :edit, :update, :destroy ]

  def index
    @businesses = Business.all
  end
 
  def show
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
    @products = Product.all
    @categories = Category.all
    @business = Business.new(business_params)
    if @business.save
      redirect_to @business, notice: "Business was successfully created." 
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def update
    @products = Product.all
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
      params.require(:business).permit(:name, :rif, :address, :phone, :email, :ig, :fb, :location, :logo, :cover, :featured, :description, :category_id, product_ids:[])
    end
end
