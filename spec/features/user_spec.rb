feature 'Testing Search Capabilites:' do
  before(:each) { add_bookmarks_and_comments } # This adds the bookmarks in
  scenario "Search for bookmark by title - Google - returns results page" do
    visit('/')
    click_link("Sign up")
    fill_in('Email', with: "nimalan.kirubakaran@test.com")
    fill_in('password', with: "password")
    click_button("Submit")
    expect(page).to have_content("Welcome, nimalan.kirubakaran@test.com")
  end
  # I need to add
end
