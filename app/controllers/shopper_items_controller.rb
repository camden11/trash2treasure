class ShopperItemsController < ApplicationController

  def create
    if active_shopper? sale
      @shopper_item = ShopperItem.find_or_initialize_by(shopper_id: current_shopper(sale).id, item_id: shopper_item_params[:item_id])
      @shopper_item.quantity += Integer(shopper_item_params[:quantity] || 0)
      @shopper_item.save
    end
  end

  def update

  end

  private

  def shopper_item_params
    params.permit(:item_id, :quantity)
  end

  def sale
    @sale ||= Item.find(shopper_item_params[:item_id]).sale
  end
end
