require "test_helper"

feature "As the site visitor, I want to see a developer's portfolio" do
  scenario "viewing all projects" do

    # Given a couple of projects (loaded from fixtures)
    projects(:ae)

    # When I visit /projects
    visit projects_path

    # Then I should see a list of projects
    page.text.must_include "YAAAA"
    page.text.must_include "WooHoooo"
  end
end
