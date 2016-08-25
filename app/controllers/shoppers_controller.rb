class ShoppersController < ApplicationController

  before_action :sale_nav, only: [:show]

  def show
    @shopper = Shopper.find params[:id]
    @sale = @shopper.sale
    redirect_to @sale unless current_shopper(@sale) == @shopper
    @shopper_items = @shopper.shopper_items
  end
end