class PropertiesController < ApplicationController
  load_and_authorize_resource
  before_action :set_property, only: [ :show, :edit, :update, :destroy ]
  
  def new
    @property = Property.new
  end

  def show
  end

  def index
    @properties = Property.all
  end

  def edit
  end

  def create
    @users = User.all
    #@property = Property.new(user_id: @user.id)
    @property = Property.new(property_params)

    if @property.save
      redirect_to @property, notice: "Property was successfully create"
    else
      render :new, status: :unprocessable_entity, alert: "Property was not successfully created"
    end

  end

  def update
    if @property.update(property_params)
      redirect_to @property, notice: "Property was successfully updated."
    else
      render "edit", status: :unprocessable_entity
    end

  end

  def destroy
    @property.destroy
    redirect_to properties_path, status: :see_other, notice: "Property was successfully destroyed." 
  end

  def delete_images_attachment    
    @images = ActiveStorage::Blob.find(params[:asset_id])
    @images.attachments.first.purge
    redirect_back(fallback_location: properties_path)
  end

  private

    def set_property
      @property = Property.find(params[:id])
    end

    def property_params
      params.require(:property).permit(:type_property, :area, :roof, :floor, :bedroom, :bathroom, :location, :special_feature, :price, :portrait, :phone, :status, :user_id, images: [])
    end
end
