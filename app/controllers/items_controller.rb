class ItemsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]

  def index
    redirect_to :back
  end

  def create
    @item = Item.new(item_params)
    if @item.organization == current_organization && @item.save
      flash[:success] = "Item created"
      redirect_to @item.sale
    elsif @item.sale
      @sale = @item.sale
      render 'sales/show'
    else
      redirect_to :back
    end
  end

  def destroy
  end

  def import
    @sale = Sale.find params[:sale_id]
    if @sale.organization == current_organization
      result = Item.import_from_spreadsheet(params[:file], @sale)
      flash[result.flash] = result.message
      redirect_to @sale
    else
      redirect_to :back
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :total_quantity, :sale_id)
  end
end
