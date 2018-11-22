feature 'Testing index page' do
  before(:each) { add_bookmarks } # This adds the bookmarks in
  scenario "Returns Hello World" do
    visit('/')
    expect(page).to have_content("Hello World!")
  end
  scenario "Viewing our bookmarks and expect to have makers" do
    visit('/bookmarks')
    expect(page).to have_content("Makers Academy")
  end
  scenario "Viewing our bookmarks and to have google" do
    visit('/bookmarks')
    expect(page).to have_content("Google")
  end
  scenario "Viewing our bookmarks and to have destroyallsoftware" do
    visit('/bookmarks')
    expect(page).to have_content("Destroy all software")
  end
  scenario "Create bookmark codeacademy and expect it on page" do
    visit('/bookmarks')
    fill_in('url', with: "http://www.codeacademy.com")
    fill_in('title', with: "Code Academy")
    click_button("Submit")
    expect(page).to have_content("Code Academy")
  end
end
