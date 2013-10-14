require "test_helper"

feature "Delete a Post" do
  scenario "Deletes an existing post" do

    # A post will be created
    @post = Post.create(title: "Becoming a Code Fellow", content: "Means striving for excellence.")


    # The post author goes the Post index page
    visit posts_path

    # That page should have a link to "Destroy" each post, that the author can click
    click_on "Destroy"

    # The index page should no longer have that post
    page.wont_have_content "Becoming a Code Fellow"
    page.wont_have_content "Means striving for excellence."

  end
end



















#require "test_helper"

#feature "Delete a Post" do
 # scenario "Deletes an existing post" do

    # A post will be created
  #  posts(:cf)

    # The post author goes the Post index page
   # visit posts_path

    # That page should have a link to "Destroy" each post, that the author can click
    #click_on "Destroy"

    # The index page should no longer have that post
    #page.wont_have_content "Becoming a Code Fellow"
    #page.wont_have_content "Means striving for excellence."

  #end
#end
