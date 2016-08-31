class ShoppersController < ApplicationController

  before_action :sale_nav, only: [:show]

  def index
    @sale = Sale.find(params[:sale_id])
    @shoppers = Shopper.where(sale_id: params[:sale_id]).where(ready_for_checkout: true).where(checked_out: nil)
  end

  def show
    @shopper = Shopper.find params[:id]
    @sale = @shopper.sale
    if belongs_to_current_organization? @sale
      redirect_to action: :index, sald_id: @sale.id unless @shopper.ready_for_checkout
    elsif current_shopper(@sale) != @shopper
      redirect_to @sale
    elsif @shopper.ready_for_checkout
      redirect_to action: :checkout
    end
    @shopper_items = @shopper.shopper_items
  end

  def search
    if @shopper = Shopper.find_by(id: params[:shopper_id], ready_for_checkout: true)
      @sale = @shopper.sale
      if current_organization != @sale.organization
        redirect_to @sale
      end
      @shopper_items = @shopper.shopper_items
      render 'show'
    else
      flash[:danger] = "Shopper not found"
      redirect_to :back
    end
  end

  def update
    @shopper = Shopper.find params[:id]
    redirect_to @shopper.sale unless @shopper = current_shopper(@shopper.sale)
    @shopper.ready_for_checkout = params[:ready_for_checkout]
    if @shopper.save && @shopper.ready_for_checkout
      redirect_to action: :checkout
    elsif
      redirect_to @shopper
    end
  end

  def checkout
    no_nav
    @shopper = Shopper.find params[:id]
    if current_shopper(@shopper.sale) != @shopper
      redirect_to @shopper.sale
      return
    end
    redirect_to @shopper unless @shopper.ready_for_checkout
  end

  def confirm_checkout
    @shopper = Shopper.find params[:id]
    if @shopper.confirm_checkout
      flash[:success] = "Shopper ##{@shopper.id} has been checked out"
    else 
      flash[:danger] = "Error checking out shopper"
    end
    redirect_to action: :index, sale_id: @shopper.sale.id
  end
end
