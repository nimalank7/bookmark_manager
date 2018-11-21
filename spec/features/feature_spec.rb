feature 'Testing index page' do
  before(:each) { add_bookmarks } # This adds the bookmarks in
  scenario "Returns Hello World" do
    visit('/')
    expect(page).to have_content("Hello World!")
  end
  scenario "Viewing our bookmarks" do
    visit('/bookmarks')
    expect(page).to have_content("http://www.makersacademy.com")
  end
  scenario "Viewing our bookmarks" do
    visit('/bookmarks')
    expect(page).to have_content("http://google.com")
  end
  scenario "Viewing our bookmarks" do
    visit('/bookmarks')
    expect(page).to have_content("http://www.destroyallsoftware.com")
  end
end
