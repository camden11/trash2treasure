class ExtraChargesController < ApplicationController

  def create
    @extra_charge = ExtraCharge.new extra_charge_params
    @extra_charge.save
  end

  def destroy

  end

  private

  def extra_charge_params
    params.require(:extra_charge).permit(:name, :price, :shopper_id)
  end
end
