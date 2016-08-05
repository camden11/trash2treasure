class OrganizationsController < ApplicationController

  def show
    @organization = Organization.find params[:id]
    @users = @organization.users
  end
end
