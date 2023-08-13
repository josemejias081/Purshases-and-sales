class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => "No tienes permiso para ejecutar esa acción"
  end 
end
