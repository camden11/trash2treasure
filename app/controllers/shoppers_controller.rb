class ShoppersController < ApplicationController

  before_action :sale_nav, only: [:show]

  def show
    @shopper = Shopper.find params[:id]
    redirect_to action: :checkout if @shopper.ready_for_checkout
    @sale = @shopper.sale
    redirect_to @sale unless current_shopper(@sale) == @shopper
    @shopper_items = @shopper.shopper_items
  end

  def update
    @shopper = Shopper.find params[:id]
    redirect_to @shopper.sale unless @shopper = current_shopper(@shopper.sale)
    @shopper.ready_for_checkout = params[:ready_for_checkout]
    if @shopper.save && @shopper.ready_for_checkout
      redirect_to action: :checkout
    else
      redirect_to @shopper
    end
  end

  def checkout
    no_nav
    @shopper = Shopper.find params[:id]
    redirect_to @shopper unless @shopper.ready_for_checkout
  end
end
