module ShoppersHelper

  def new_shopper(sale)
    unless logged_in? || active_shopper?(sale)
      session[:active_sales] ||= []
      session[:active_sales] << sale.id
      @current_shopper = Shopper.create(sale_id: sale.id)
      session[session_key(sale)] = @current_shopper.id
    end
  end

  def current_shopper(sale)
    if shopper_id = session[session_key(sale)]
      @current_shopper ||= Shopper.find(shopper_id)
    end
  end

  def active_shopper?(sale)
    !current_shopper(sale).nil?
  end

  def session_key(sale)
    "shopper_id_#{sale.id}".to_sym
  end

  def delete_shoppers
    session[:active_sales].try(:each) do |sale_id|
      session.delete "shopper_id_#{sale_id}".to_sym
    end
  end

  private

end