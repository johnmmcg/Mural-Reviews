require 'spec_helper'

feature 'As an authenticated user,
I want to sign out
So that no one else can post items or reviews on my behalf' do

  scenario 'user can sign out' do
    User.create(username: 'johnmcg', email: 'johnmcg@gmail.com', password: 'password')

    visit new_user_session_path

    fill_in 'Email', with: "johnmcg@gmail.com"
    fill_in 'Password', with: "password"
    click_button 'Log in'

    click_link 'Sign Out'
    expect(page).to have_content("Sign In")
  end

  scenario 'users that are not signed in cannot sign out' do
    visit root_path
    expect(page).to_not have_content('Sign Out')
  end

end
