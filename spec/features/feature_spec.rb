feature 'Testing Bookmark Manager:' do
  before(:each) { add_bookmarks_and_comments_and_users } # This adds the bookmarks in
  scenario "Viewing our bookmarks and expect to have Makers" do
    sign_in_and_submit
    expect(page).to have_content("Makers Academy")
  end
  scenario "Viewing our bookmarks and to have Google" do
    sign_in_and_submit
    expect(page).to have_content("Google")
  end
  scenario "Viewing our bookmarks and to have Destroyallsoftware" do
    sign_in_and_submit
    expect(page).to have_content("Destroy all software")
  end
  scenario "Create bookmark Codeacademy and expect it on page" do
    sign_in_and_submit
    fill_in('url', with: "http://www.codeacademy.com")
    fill_in('title', with: "Code Academy")
    click_button("Submit")
    expect(page).to have_content("Code Academy")
    expect(current_path).to eq("/bookmarks")
  end
  scenario "Deleting Google bookmark and hence no longer on page" do
    sign_in_and_submit
    click_button("Delete_Google")
    expect(page).not_to have_content("Google")
  end
  scenario "Click update on Google bookmark and enter new title text appears" do
    sign_in_and_submit
    click_button("Update_Google")
    expect(page).to have_content("Please enter new title and URL:")
  end
  scenario "Update Google bookmark to Yahoo" do
    sign_in_and_submit
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
