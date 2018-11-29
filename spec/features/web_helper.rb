def sign_in_and_submit
  visit('/')
  click_link("Sign up")
  fill_in('Email', with: "Bob@test.com")
  fill_in('password', with: "password")
  click_button("Submit")
end
