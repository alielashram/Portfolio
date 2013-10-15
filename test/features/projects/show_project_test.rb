require "test_helper"

feature "I want to be able to view a single project" do
  scenario "showing a single project" do
    visit project_path(projects(:ae))
    page.must_have_content "YAAAA"
    page.must_have_content "WooHoooo"
  end
end
