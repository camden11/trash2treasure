class SalesController < ApplicationController

  # before_action :authorized_user

  def index
  end

  def show
  end

  def create
    @sale = current_organization.sales.build(sale_params)
    if @sale.save
      flash[:success] = "Sale created!"
    end
    redirect_to current_organization
  end

  def destroy
  end

  private

  def sale_params
    params.require(:sale).permit(:name, :start_time, :end_time)
  end

end
