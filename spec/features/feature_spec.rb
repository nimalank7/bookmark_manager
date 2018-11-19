feature 'Testing index page' do
  scenario "Returns Hello World" do
    visit('/')
    expect(page).to have_content("Hello World!")
  end
end
