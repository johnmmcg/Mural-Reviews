require 'rails_helper'

feature 'user deletes account;
  As an authenticated user
  I want to delete my account
  So that my information is no longer retained by the app' do

  before(:each) do
    User.create(username: 'johnmcg', email: 'johnmcg@gmail.com', password: 'password')

    visit new_user_session_path

    fill_in 'Email', with: "johnmcg@gmail.com"
    fill_in 'Password', with: "password"
    click_button 'Log in'
  end

  scenario 'user deletes account' do
    visit edit_user_registration_path
    click_button 'Cancel my account'

    expect(page).to have_content 'Bye! Your account has been successfully cancelled. We hope to see you again soon.'
  end
end
