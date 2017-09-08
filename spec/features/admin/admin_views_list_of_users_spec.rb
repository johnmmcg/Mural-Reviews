require 'rails_helper'

feature 'admin views a list of users' do

  before(:each) do
    User.create(username: "super_admin", password: "password", email: "admin@gmail.com", admin: true)

    visit new_user_session_path

    fill_in 'Email', with: "admin@gmail.com"
    fill_in 'Password', with: "password"
    click_button 'Log in'
  end

  scenario 'admin sees users on users index page' do
    User.create(username: "notanadmin", password: "password1234", email: "notanadmin@gmail.com")
    visit root_path

    click_link 'Users Index'

    expect(page).to have_content "notanadmin"
  end
end
