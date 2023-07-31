class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: [ :show, :edit, :update, :destroy ]


  def index
    @users = User.all
  end

  def new
    @user = User.new
    @businesses = Business.all
  end

  def create 
    @businesses = Business.all
    @user = User.new(user_params)
    if @user.save 
      flash[:success] = "Usuario creado exitosamente"
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @users = User.all
    @businesses = Business.all
    @user = User.find(params[:id])
    
  end

  def edit
    @businesses = Business.all
  end

  def update
    @businesses = Business.all
    if @user.update(user_params)
      redirect_to @user
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, status: :see_other
  end

  def reset_password
    @user = User.find(params[:user_id])
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:id, :name, :email, :role, :status, :address, :phone, :active, :password, :password_confirmation, :business_ids)
    end
end
