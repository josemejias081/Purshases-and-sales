class HomeController < ApplicationController
  def welcome
    @categories = Category.all
    @products = Product.all
    @businesses = Business.all
  end

  def contact
  end

  def news
  end
end
