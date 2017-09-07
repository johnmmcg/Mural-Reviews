require 'rails_helper'

feature 'user signs up;
  As a user
  I want to sign up
  So that I can leave reviews' do

  scenario 'specifying valid and required information' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: "TheDude"
    fill_in 'Email', with: "test@gmail.com"
    fill_in 'Password', with: "password"
    fill_in 'Password Confirmation', with: "password"
    click_button 'Sign up'

    expect(page).to have_content("You have signed up successfully.")
    expect(page).to have_content("Sign Out")
  end

  scenario 'required information is not supplied' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign up'

    expect(page).to have_content "can't be blank"
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'password does not match password confirmation' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: "TheDude"
    fill_in 'Email', with: "testing@gmail.com"
    fill_in 'Password', with: "password"
    fill_in 'Password Confirmation', with: "differentpassword"
    click_button 'Sign up'

    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content("Sign out")
  end

end
