class ExtraChargesController < ApplicationController

  def create
    @extra_charge = ExtraCharge.new extra_charge_params
    if @extra_charge.sale.organization == current_organization && @extra_charge.save
      render 'create'
    else
      render nothing: true
    end
  end

  def destroy
    @extra_charge = ExtraCharge.find(params[:id])
    if @extra_charge.sale.organization == current_organization && @extra_charge.destroy
      render 'destroy'
    else
      render nothing: true
    end
  end

  private

  def extra_charge_params
    params.require(:extra_charge).permit(:name, :price, :shopper_id)
  end
end
