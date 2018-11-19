feature 'Testing index page' do
  scenario "Returns Hello World" do
    visit('/')
    expect(page).to have_content("Hello World!")
  end
  scenario "Viewing our bookmarks" do
    visit('/bookmarks')
    expect(page).to have_content("http://www.google.com/")
  end
end
