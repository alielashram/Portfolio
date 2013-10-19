require "test_helper"

feature "creating a post" do
  scenario "works with valid data" do

    # Given an authorized user completes a new post form
    sign_up

    visit posts_path

    click_on "New Post"

    fill_in "Title", with: posts(:cf).title
    fill_in "Content", with: posts(:cf).content
    click_on 'Create Post'

    # A new post should be created and displayed
    page.text.must_include 'Post was successfully created'
    page.text.must_include posts(:cf).title

    # New post should be attributed to a user
    page.has_css? "#author"
    page.text.must_include users(:df).email
  end

  scenario "only editors can publish" do
    # Given an author's post
    # When I visit the edit page
    # There is no checkbox for published
  end

  scenario "unauthenticated site vistiors cannot create posts" do
    #
  end
end
