module ApplicationHelper

  def body_class_name
    classes = "#{controller.controller_name} #{controller.action_name}"
    classes += " adjust-body-position" if @sale_nav && active_shopper?(@sale)
    classes
  end

  def item_class_name(item)
    "item-#{item.id}"
  end

  def item_price_class_name(item)
    "item-price-#{item.id}"
  end

  def shopper_item_class_name(shopper_item)
    "shopper-item-#{shopper_item.id}"
  end
end
