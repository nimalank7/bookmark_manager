feature 'Testing Bookmark Manager:' do
  before(:each) { add_bookmarks_and_comments } # This adds the bookmarks in
  scenario "Returns Hello World" do
    visit('/')
    expect(page).to have_content("Hello World!")
  end
  scenario "Viewing our bookmarks and expect to have Makers" do
    visit('/bookmarks')
    expect(page).to have_content("Makers Academy")
  end
  scenario "Viewing our bookmarks and to have Google" do
    visit('/bookmarks')
    expect(page).to have_content("Google")
  end
  scenario "Viewing our bookmarks and to have Destroyallsoftware" do
    visit('/bookmarks')
    expect(page).to have_content("Destroy all software")
  end
  scenario "Create bookmark Codeacademy and expect it on page" do
    visit('/bookmarks')
    fill_in('url', with: "http://www.codeacademy.com")
    fill_in('title', with: "Code Academy")
    click_button("Submit")
    expect(page).to have_content("Code Academy")
    expect(current_path).to eq("/bookmarks")
  end
  scenario "Deleting Google bookmark and hence no longer on page" do
    visit('/bookmarks')
    click_button("Delete_Google")
    expect(page).not_to have_content("Google")
  end
  scenario "Click update on Google bookmark and enter new title text appears" do
    visit('/bookmarks')
    click_button("Update_Google")
    expect(page).to have_content("Please enter new title and URL:")
  end
  scenario "Update Google bookmark to Yahoo" do
    visit('/bookmarks')
    click_button("Update_Google")
    fill_in('url', with: "http://www.yahoo.com")
    fill_in('title', with: "Yahoo")
    click_button("Update")
    expect(current_path).to eq("/bookmarks")
  end
end

=begin
#scenario "Returns invalid URL if url typed incorrectly" do
  #visit('/bookmarks')
  #fill_in('url', with: "codeacademy")
  #fill_in('title', with: "Code Academy")
  #click_button("Submit")
  #expect(page).to have_content("Invalid URL entered")
#end
=end
