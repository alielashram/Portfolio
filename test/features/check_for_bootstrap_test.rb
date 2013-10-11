require "test_helper"

feature "Check for Bootstrap" do
  scenario "Bootstrap theme appears and works" do

    # Root page is loaded
    visit root_path

    # Test to see if the find out more button from the theme appears
    click_on "Find Out More"

    # Our services section of root page is displayed
    page.text.must_include 'Our Services'

  end
end
