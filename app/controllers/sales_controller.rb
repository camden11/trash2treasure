class SalesController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]

  def index
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new sale_params
    @sale.organization_id = current_organization.id
    if @sale.save
      flash[:success] = "#{@sale.name} has been created"
      redirect_to @sale
    else 
      render 'new'
    end
  end

  def destroy
  end

  private

  def sale_params
    params.require(:sale).permit(:name, :start_time, :end_time)
  end

end
