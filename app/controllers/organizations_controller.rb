class OrganizationsController < ApplicationController

  def show
    @organization = Organization.find params[:id]
    @users = @organization.users
    @sales = @organization.sales
  end

  private

  def authorized_user
    current_user && current_user.is_member_of?(@organization)
  end
end
