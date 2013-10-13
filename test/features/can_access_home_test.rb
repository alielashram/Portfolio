require "test_helper"

feature "Can Access Home Page" do
  scenario "visit posts index" do
    visit root_path
    page.must_have_content "Ali El-Ashram"
    #page.wont_have_content "Hello World!"
  end
end
