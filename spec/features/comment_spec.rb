feature 'Testing Comments' do
  before(:each) { add_bookmarks_and_comments } # This adds the bookmarks in
  scenario "Clicking on comment for Google and displays Please comment'" do
    sign_in_and_submit
    click_button("Comment_Google")
    expect(page).to have_content("Please add a comment:")
  end
  scenario "Create comment on Google" do
    sign_in_and_submit
    click_button("Comment_Google")
    fill_in('body', with: "The world's go-to search engine")
    click_button("Comment")
    expect(page).to have_content("The world's go-to search engine")
  end
end
=begin this feature test is passing but it shouldn't
=end
