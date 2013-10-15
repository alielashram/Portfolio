require "test_helper"

feature "Delete a Post" do
  scenario "Deletes an existing post" do

    # A post will be created
    projects(:ae)

    # The post author goes the Post index page
    visit projects_path

    # That page should have a link to "Destroy" each post, that the author can click
    click_on "Destroy"

    # The index page should no longer have that post
    page.wont_have_content "YAAAA"
    page.wont_have_content "WooHoooo"

  end
end
