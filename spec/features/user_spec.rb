feature 'Testing User features:' do
  before(:each) { add_bookmarks_and_comments_and_users } # This adds the bookmarks in
  scenario "creating a new user" do
    visit('/')
    click_link("Sign up")
    fill_in('Email', with: "nimalan.kirubakaran@testing.com")
    fill_in('password', with: "password")
    click_button("Submit")
    expect(page).to have_content("Welcome, nimalan.kirubakaran@testing.com")
  end
  scenario "Creating a user that already exists" do
    visit('/')
    click_link("Sign up")
    fill_in('Email', with: "nimalan.kirubakaran@test.com")
    fill_in('password', with: "password")
    click_button("Submit")
    expect(page).to have_content("Sorry, but that email address is already taken")
  end
  scenario "Successful login of nim password returns bookmark page" do
    visit('/')
    fill_in('email', with: "nimalan.kirubakaran@test.com")
    fill_in('password', with: "password")
    click_button("Login")
    expect(page).to have_content("Welcome, nimalan.kirubakaran@test.com")
  end
  scenario "Incorrect email at login returns 'Please enter the correct username or password'" do
    visit('/')
    fill_in('email', with: "nimalan.kirubakaran@incorrect.com")
    fill_in('password', with: "password")
    click_button("Login")
    expect(page).to have_content("Please enter the correct email or password")
  end
  scenario "Incorrect password at login returns 'Please enter the correct email or password'" do
    visit('/')
    fill_in('email', with: "nimalan.kirubakaran@test.com")
    fill_in('password', with: "hello")
    click_button("Login")
    expect(page).to have_content("Please enter the correct email or password")
  end
end
