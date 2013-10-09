require "test_helper"

feature "creating a post" do
  scenario "works with valid data" do

    # Given a completed post form
    visit posts_path
    click_on 'New Post'
    fill_in 'Title', with: 'Our Beloved'
    fill_in 'Content', with: 'Born to father Abdullah and mother Amina'

    # When I submit the form
    click_on 'Create Post'

    # I should see the new post
    page.text.must_include 'Our Beloved'
    page.text.must_include 'Born to father Abdullah and mother Amina'

    # And a success message
    page.text.must_include 'Post was successfully created'

  end
end
