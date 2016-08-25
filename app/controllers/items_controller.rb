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
    if count = Item.import_from_spreadsheet(params[:file])
      flash[:success] = "#{count} items created"
    else
      flash[:danger] = "Error reading file"
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :code, :total_quantity, :sale_id)
  end
end
