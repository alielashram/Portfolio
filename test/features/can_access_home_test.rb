require "test_helper"

feature "Can Access Home Page" do
  scenario "visit home index" do
    visit root_path
    page.must_have_content "Hello World"
    page.wont_have_content "Goobye All!"
  end
end
