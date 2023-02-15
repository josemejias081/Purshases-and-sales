class CategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :set_category, only: [ :show, :edit, :update, :destroy ]

  def index
    @businesses = Business.all
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)    
    if @category.save
      redirect_to @category, notice: "Category was successfully created." 
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: "Category was successfully updated." 
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, status: :see_other, notice: "Category was successfully destroyed."  
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :photo, :icon, :description, :featured)
    end
end
