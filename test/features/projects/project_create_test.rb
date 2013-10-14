require "test_helper"

feature "As the site owner, I want to add a portfolio item so that I can show off my work" do
  scenario "adding a new project" do
    visit projects_path
    click_on "New project"
    fill_in "Name", with: projects(:ae).name
    fill_in "Technologies used", with: projects(:ae).technologies_used
    click_on "Create Project"
    page.text.must_include "Project has been created."
    page.text.must_include "Rails"
  end
end
