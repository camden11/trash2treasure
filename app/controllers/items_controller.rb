class ItemsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]

  def index
    unless request.xhr?
      redirect_to :back 
    else
      @sale = Sale.find(params[:sale_id])
      @items = Item.search(params[:sale_id], params[:query])
      @categories == checked_categories.size > 0 ? checked_categories : item_categories
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.organization == current_organization && @item.save
      flash[:success] = "Item created"
      redirect_to @item.sale
    elsif @item.sale
      redirect_to @item.sale
    else
      redirect_to :back
    end
  end

  def destroy
  end

  def import
    @sale = Sale.find params[:sale_id]
    obj = S3_BUCKET.objects[params[:file].original_filename]
    obj.write(file: params[:file], acl: :public_read)
    if @sale.organization == current_organization
      result = Item.import_from_spreadsheet(obj.url_for(:read, :secure => true), @sale)
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

  def checked_categories
    categories = []
    item_categories.each do |category|
      if params[category.to_sym] == 1
        categories << category
      end
    end
    categories
  end
end
