class OrganizationsController < ApplicationController

  def show
    @organization = Organization.find params[:id]
    @users = @organization.users
    @sales = @organization.sales
  end

end
