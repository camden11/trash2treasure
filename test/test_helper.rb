require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def logged_in?
    !session[:user_id].nil?
  end
  
  def log_in(user, options = {})
    if integration_test?
      password = options[:password] || "test123"
      post login_path, session: { email: user.email, password: password }
    else
      session[:user_id] = user.id
    end
  end

  private

  def integration_test?
    defined?(post_via_redirect)
  end
end
