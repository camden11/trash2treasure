class ShoppersController < ApplicationController

  before_action :sale_nav, only: [:show]

  def show
    @shopper = Shopper.find params[:id]
    @sale = @shopper.sale
    @items = @shopper.items
  end
end
