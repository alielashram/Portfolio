require 'simplecov'
SimpleCov.start 'rails'
ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_up
    visit posts_path
    click_on "Register"

    # When I register with valid info
    fill_in "Email", with: users(:df).email
    fill_in "Password", with: users(:df).encrypted_password
    fill_in "Password confirmation", with: users(:df).encrypted_password
    click_on "Sign up"
  end

  def sign_in
    visit posts_path
    click_on "Sign In"
    fill_in "Email", with: users(:df).email
    fill_in "Password", with: users(:df).encrypted_password
    click_on "Sign in"
  end
end
