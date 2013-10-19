require "test_helper"

feature "Editing a Post" do
  scenario "submit updates to an existing post" do

    sign_up

    visit posts_path
    click_on "Sign Out"

    sign_in

    # The post author goes to a post's show page
    visit edit_post_path(posts(:cf))

    # That page should have a link to "Edit" that the author can click
    #click_on 'Edit'

    # A form is filled in with the changed attributes
    page.text.must_include "Means striving for excellence."

    fill_in "Title", with: "Take control"

    # The form is submitted
    click_on 'Update Post'

    # The newly updated post should be shown to the author with a confirmation message
    page.text.must_include "Post was successfully updated."
    page.text.must_include "Take control"
  end

  scenario "Only editors can publish" do
    # Given a new post
    # When I update the published checkbox to checked and save
    # Then the post will be published

  end

  scenario "Authors cannot publish" do
    # Given an author's post
    # When I visit the edit page
    # There is no checkbox for published

  end

  scenario "unauthenticated site vistiors cannot delete posts" do
    #
  end
end
