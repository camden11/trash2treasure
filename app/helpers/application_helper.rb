module ApplicationHelper

  def body_class_name
    classes = "#{controller.controller_name} #{controller.action_name}"
    classes += " adjust-body-position" if @sale_nav && active_shopper?(@sale)
    classes
  end

end
