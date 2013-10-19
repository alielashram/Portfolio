require "test_helper"

feature "Editing a Post" do
  scenario "submit updates to an existing post" do

    sign_up

    visit posts_path
    click_on "Sign Out"

    sign_in

    # The post author goes to a post's show page
    visit edit_post_path(posts(:cf))
    save_and_open_page

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
end
