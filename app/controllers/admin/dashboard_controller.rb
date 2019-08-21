class Admin::DashboardController < ApplicationController
  def show
    @categorieList = Category.all
    @productList = Product.all
  end
end
