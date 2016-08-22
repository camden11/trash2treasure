module ShoppersHelper

  def new_shopper(sale_id)
    unless logged_in? || active_shopper?(sale_id)
      @current_shopper = Shopper.create(sale_id: sale_id)
      session[session_key(sale_id)] = @current_shopper.id
    end
  end

  def current_shopper(sale_id)
    if shopper_id = session[session_key(sale_id)]
      @current_shopper ||= Shopper.find(shopper_id)
    end
  end

  def active_shopper?(sale_id)
    !current_shopper(sale_id).nil?
  end

  def session_key(sale_id)
    "shopper_id_#{sale_id}".to_sym
  end
end