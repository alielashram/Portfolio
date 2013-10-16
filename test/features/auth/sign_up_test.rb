require "test_helper"

feature("As a site visitor I want to be able to sign up for an account so that I can perform actions that require me to be logged in.") do
  scenario "sign up" do
    # Given a registration form
    visit posts_path
    click_on "Register"

    # When I register with valid info
    fill_in "Email", with: users(:df).email
    fill_in "Password", with: users(:df).encrypted_password
    fill_in "Password confirmation", with: users(:df).encrypted_password
    click_on "Sign up"

    # Then I should be signed up
    page.text.must_include "Welcome! You have signed up successfully."
    page.wont_have_content "There was a problem with your sign up"
  end
end
