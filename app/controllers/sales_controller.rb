class SalesController < ApplicationController

  before_action :logged_in_user, only: [:new, :create, :destroy]
  before_action :sale_nav, only: [:show]

  def index
  end

  def show
    @sale = Sale.find(params[:id])
    redirect_if_ready_for_checkout @sale
    new_shopper @sale
    @item = Item.new if @sale.organization == current_organization
    @items = @sale.items.order('name ASC')
    @categories = item_categories
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
