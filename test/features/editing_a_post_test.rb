require "test_helper"

feature "Editing a Post" do
  scenario "submit updates to an existing post" do

    # A post will be created
    @post = Post.create(title: "Becoming a Code Fellow", content: "Means striving for excellence.")

    # The post author goes to that post's show page
    visit post_path(@post)

    # That page should have a link to "Edit" that the author can click
    click_on 'Edit'

    # A form is filled in with the changed attributes
    page.text.must_include "Means striving for excellence."


    # The form is submitted
    click_on 'Update Post'

    # The newly updated post should be shown to the author with a
    #confirmation message
    page.text.must_include "Post was successfully updated."

  end
end
