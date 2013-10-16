require "test_helper"

feature "Visiting the Post Index" do
  scenario "existing posts are listed" do

    sign_up

    #A post will be created
    posts(:cf)

    #Someone will visit the post listing
    visit posts_path

    #The post that was created should be there
    page.text.must_include "Becoming a Code Fellow"
    page.text.must_include "Means striving for excellence."

  end
end
