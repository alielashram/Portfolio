require "test_helper"

# sets up a test post by an author
# returns a post_id
def set_up_a_post_by_author
  # Given a logged in author
  sign_in(:author)
  # And a post by that author
  visit posts_path
  click_on "New Post"
  fill_in "Title", with: "author's title destroy test"
  fill_in "Content",  with: "author's body"
  click_on "Create Post"
  # figure out the post id from the page url
  post_id = current_url.split('/').last
end
feature "delete works for different roles" do
  scenario "an author can delete her own unpublished posts" do
    post_id = set_up_a_post_by_author
    click_on "Back"
    click_link "Destroy", href: "/posts/#{post_id}"
    # Then I should see a message about the post being deleted
    page.text.must_include "Post was deleted"
    # And the post title should not be in the index
    #page.wont_have_content "author's title destroy test"
  end

  scenario "an editor can delete anyone's posts" do
    # Given a post by another user
    # And a logged in editor
    # When I click on destroy link for that post
    # Then I should see a message about the post being deleted
    # And the post title should not be in the index
    post_id = set_up_a_post_by_author
    click_link "Sign Out"
    sign_in "editor"
    visit posts_path
    click_link("Destroy", href: "/posts/#{post_id}")
    # Then I should see a message about the post being deleted
    page.text.must_include "Post was deleted"
    # And the post title should not be in the index
    #page.wont_have_content "author's title destroy test"
  end

  # scenario "unauthenticated site vistiors cannot delete posts" do
  #   # Given a published post
  #   # When a user visits the blog (posts#index)
  #   # Then I do not see a destroy button for any post (maybe commennts later)

  # end

end
