require 'spec_helper'

feature 'user signs in;
  As a user
  I want to sign in
  So that I can leave reviews' do

  scenario 'a non-signed-in user sees sign in button on home page' do
    visit root_path
    expect(page).to have_content "Sign In"
  end

  scenario 'an existing user specifies a valid username and password' do
    User.create(username: 'johnmcg', email: 'johnmcg@gmail.com', password: 'password')

    visit new_user_session_path

    fill_in 'Email', with: "johnmcg@gmail.com"
    fill_in 'Password', with: "password"
    click_button 'Log in'

    expect(page).to have_content "Signed in successfully."
  end

  scenario 'a nonexistant username and password is supplied' do
    visit new_user_session_path

    fill_in 'Email', with: "bob@gmaill.com"
    fill_in 'Password', with: "asdfasdf"
    click_button 'Log in'

    expect(page).to have_content "Invalid Email or password."
  end

  scenario 'an existing username with the wrong password is supplied and denied' do
    User.create(username: 'johnmcg', email: 'johnmcg@gmail.com', password: 'password')
    visit new_user_session_path

    fill_in 'Email', with: "johnmcg@gmail.com"
    fill_in 'Password', with: "asdfasdf"
    click_button 'Log in'

    expect(page).to have_content "Invalid Email or password."
  end

  scenario 'an already signed in user cannot re-sign in' do
    User.create(username: 'johnmcg', email: 'johnmcg@gmail.com', password: 'password')

    visit new_user_session_path

    fill_in 'Email', with: "johnmcg@gmail.com"
    fill_in 'Password', with: "password"
    click_button 'Log in'

    expect(page).to have_content "Signed in successfully."
    expect(page).to_not have_content "Sign In"

  end

end
