class ShopperItemsController < ApplicationController

  def create
    @shopper_item = current_shopper(sale).shopper_items.build shopper_item_params
    @shopper_item.save
  end

  def destroy
  end

  private

  def shopper_item_params
    params.permit(:item_id, :quantity)
  end

  def sale
    Item.find(shopper_item_params[:item_id]).sale
  end
end
