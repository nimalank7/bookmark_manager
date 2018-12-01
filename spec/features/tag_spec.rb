feature 'Testing Tags' do
  before(:each) { add_bookmarks_and_comments_and_users } # This adds the bookmarks in
  scenario "Clicking on Tag Google and displays page" do
    sign_in_and_submit
    click_button("Tag_Google")
    expect(page).to have_content("Please add a tag:")
  end
  scenario "Clicking on Tag Google and displays page" do
    sign_in_and_submit
    click_button("Tag_Google")
    fill_in('content', with: "Test tag")
    click_button("Add tag")
    expect(page).to have_content("Test tag")
  end
  scenario "Clicking on the travel tag displays list of bookmarks" do
    sign_in_and_submit
    find(id: '2').click_link('Travel')
    expect(page).to have_content("Makers Academy")
    expect(page).to have_content("Google")
  end
end
=begin this feature test is passing but it shouldn't
=end
