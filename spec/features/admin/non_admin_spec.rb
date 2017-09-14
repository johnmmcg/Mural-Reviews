require 'rails_helper'

feature 'non-admin cannot access user index' do

  before(:each) do
    User.create(username: "notanadmin", password: "password1234", email: "notanadmin@gmail.com")

    visit new_user_session_path

    fill_in 'Email', with: "notanadmin@gmail.com"
    fill_in 'Password', with: "password1234"
    click_button 'Log in'
  end

  scenario 'non-admin tries to access admin user index' do
    visit admin_users_path

    expect(page).to have_content "You must be an admin to visit that page."
  end

end
