class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include ShoppersHelper

  helper_method :item_categories

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  private

  def website
    @website = true
  end

  def sale_nav
    @sale_nav = true
  end

  def no_nav
    @no_nav = true
  end

  def auto_refresh
    @auto_refresh = true
  end

  def item_categories
    ["Accessories", "School Supplies", "Storage", "Kitchen", "Electronics and Appliances", "Sports", "Bathroom", "Household", "Shoes"] 
  end
end
