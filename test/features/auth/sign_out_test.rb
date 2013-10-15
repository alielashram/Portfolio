require "test_helper"

feature("As a site visitor I want to be able to sign out.") do
  scenario "sign out" do
    # Given a registration form
    visit projects_path
    click_on "Register"

    # When I register with valid info
    fill_in "Email", with: users(:df).email
    fill_in "Password", with: users(:df).encrypted_password
    fill_in "Password confirmation", with: users(:df).encrypted_password
    click_on "Sign up"

    # Then I should be signed up
    page.text.must_include "Welcome! You have signed up successfully."

    # Sign out
    click_on "Sign Out"
    page.text.must_include "Signed out successfully."
  end
end





