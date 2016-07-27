require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  
  def setup
    @organization = organizations(:trash2treasure)
  end

  test "should be valid" do
    assert @organization.valid?
  end

  test "name should not be too long" do
    @organization.name = "a" * 51
    assert_not @organization.valid?
  end

  test "name should be unique" do
    @organization.name = "org2"
    assert_not @organization.valid?
  end

  test "join code should be generated" do
    org = Organization.create(name: "test")
    assert org.reload.join_code.present?
  end

end
