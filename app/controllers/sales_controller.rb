class SalesController < ApplicationController

  before_action :logged_in_user, only: [:new, :create, :destroy]

  include ShoppersHelper

  def index
  end

  def show
    @sale = Sale.find(params[:id])
    new_shopper @sale.id
    @item = Item.new if @sale.organization == current_organization
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = current_organization.sales.build(sale_params)
    if @sale.save
      flash[:success] = "#{@sale.name} has been created"
      redirect_to @sale
    else 
      render 'new'
    end
  end

  def destroy
  end

  private

  def sale_params
    params.require(:sale).permit(:name, :start_time, :end_time)
  end

end
