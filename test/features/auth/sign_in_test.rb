require "test_helper"

feature("As a site visitor I want to be able to sign in.") do
  scenario "sign in" do

    sign_up

    visit posts_path
    click_on "Sign Out"

    sign_in

    page.text.must_include "Signed in successfully."
 end
end
