feature 'Testing Search Capabilites:' do
  before(:each) { add_bookmarks } # This adds the bookmarks in

  scenario "Search for bookmark by title - Google - returns results page" do
    visit('/bookmarks')
    fill_in('search', with: "Google")
    click_button("Search")
    expect(current_path).to eq("/search_results")
    expect(page).to have_content("Google")
  end

  scenario "Search for bookmark by URL - Google - returns results page" do
    visit('/bookmarks')
    fill_in('search', with: "http://google.com")
    click_button("Search")
    expect(current_path).to eq("/search_results")
    expect(page).to have_content("Google")
  end

  scenario "Create, search and update BBC bookmark to BBC Sport" do
    visit('/bookmarks')
    fill_in('url', with: "http://www.bbc.co.uk")
    fill_in('title', with: "BBC")
    click_button("Submit")
    expect(page).to have_content("BBC")
    expect(current_path).to eq("/bookmarks")
    fill_in('search', with: "http://www.bbc.co.uk")
    click_button("Search")
    expect(current_path).to eq("/search_results")
    click_button("Update_BBC")
    fill_in('url', with: "http://www.bbc.co.uk/sport")
    fill_in('title', with: "BBC Sports")
    click_button("Update")
    expect(current_path).to eq("/bookmarks")
    expect(page).to have_content("BBC Sport")
  end
  scenario "Create, search and delete BBC bookmark" do
    visit('/bookmarks')
    fill_in('url', with: "http://www.bbc.co.uk")
    fill_in('title', with: "BBC")
    click_button("Submit")
    expect(page).to have_content("BBC")
    expect(current_path).to eq("/bookmarks")
    fill_in('search', with: "http://www.bbc.co.uk")
    click_button("Search")
    expect(current_path).to eq("/search_results")
    click_button("Delete_BBC")
    expect(current_path).to eq("/bookmarks")
    expect(page).not_to have_content("BBC")
  end
  scenario "Return to home after searching" do
    visit('/bookmarks')
    fill_in('search', with: "http://google.com")
    click_button("Search")
    expect(current_path).to eq("/search_results")
    expect(page).to have_content("Google")
    click_button("Home")
    expect(current_path).to eq("/bookmarks")
  end
  scenario "Returns not found search" do
    visit('/bookmarks')
    fill_in('search', with: "http://www.nobookmark.com")
    click_button("Search")
    expect(current_path).to eq("/not_found")
    expect(page).to have_content("Bookmark not found")
    click_button("Home")
    expect(current_path).to eq("/bookmarks")
  end
  scenario "Return to home after not found search" do
    visit('/bookmarks')
    fill_in('search', with: "http://www.nobookmark.com")
    click_button("Search")
    expect(current_path).to eq("/not_found")
    expect(page).to have_content("Bookmark not found")
    click_button("Home")
    expect(current_path).to eq("/bookmarks")
  end
end
