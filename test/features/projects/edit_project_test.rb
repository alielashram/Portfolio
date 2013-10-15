require "test_helper"

feature "As the site owner, I want to edit a project so that I can correct typos" do
  scenario "editing an existing project" do
    # Given an existing project
    visit edit_project_path(projects(:ae))

    # When I make changes
    fill_in "Name", with: "YAAAA!"
    fill_in "Technologies used", with: "YAAAAAW!"
    click_on "Update Project"

    # Then the changes should be saved and shown
    page.text.must_include "Project was successfully updated."
    page.text.must_include "YAAAA"
    page.text.wont_include "WooHoooo"
  end

  scenario "incorrectly editing an existing project" do
    # Given an existing project
    visit edit_project_path(projects(:ae))

    # When I submit invalid changes
    fill_in "Name", with: "Q"
    click_on "Update Project"

    # Then the changes should not be saved, and I should get to try again
    page.text.must_include "Project could not be saved."
    page.text.must_include "Name is too short"
  end
end
