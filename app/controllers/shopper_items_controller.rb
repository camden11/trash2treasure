class ShopperItemsController < ApplicationController

  def create
    if params[:shopper_item] && current_organization == Item.find_by(id: good_params[:item_id]).organization
      @shopper_item = ShopperItem.find_or_initialize_by(shopper_id: good_params[:shopper_id], item_id: good_params[:item_id])
      @shopper_item.quantity += Integer(good_params[:quantity] || 0)
      @shopper_item.save
      render template: 'shopper_items/destroy'
    elsif active_shopper? sale
      @shopper_item = ShopperItem.find_or_initialize_by(shopper_id: current_shopper(sale).id, item_id: shopper_item_params[:item_id])
      @shopper_item.quantity += Integer(shopper_item_params[:quantity] || 0)
      @shopper_item.save
    end
  end

  def update
    @shopper_item = ShopperItem.find(params[:id])
    @shopper_item.quantity = params[:quantity]
    if (current_shopper(@shopper_item.sale) == @shopper_item.shopper || @shopper_item.sale.organization == current_organization) && @shopper_item.save
      render 'update'
    else
      render nothing: true
    end
  end

  def destroy
    @shopper_item = ShopperItem.find(params[:id])
    if (current_shopper(@shopper_item.sale) == @shopper_item.shopper || @shopper_item.sale.organization == current_organization) && @shopper_item.destroy
      render 'destroy'
    else
      render nothing: true
    end
  end

  private

  def shopper_item_params
    params.permit(:item_id, :quantity)
  end

  def good_params
    params.require(:shopper_item).permit(:item_id, :shopper_id, :quantity)
  end

  def sale
    @sale ||= Item.find(shopper_item_params[:item_id]).sale
  end
end
