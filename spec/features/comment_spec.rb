feature 'Testing Comments' do
  before(:each) { add_bookmarks } # This adds the bookmarks in
  scenario "Clicking on comment for Google and displays Please comment'" do
    visit('/bookmarks')
    click_button("Comment_Google")
    expect(current_path).to eq("/create_comment")
    expect(page).to have_content("Please add a comment")
  end
end
