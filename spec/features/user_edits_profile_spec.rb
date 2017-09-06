require 'rails_helper'

feature 'user edits profile;
  As an authenticated user
  I want to update my information
  So that I can keep my profile up to date' do

  before(:each) do
    User.create(username: 'johnmcg', email: 'johnmcg@gmail.com', password: 'password')

    visit new_user_session_path

    fill_in 'Email', with: "johnmcg@gmail.com"
    fill_in 'Password', with: "password"
    click_button 'Log in'
  end

  scenario 'user accesses edit profile page' do
    visit root_path

    click_link 'Edit Profile'
    expect(page).to have_content('Edit')
  end

  scenario 'user successfully changes email' do
    visit edit_user_registration_path

    fill_in 'Email', with: 'differentemail@gmail.com'
    fill_in "Current password", with: 'password'

    click_button 'Update'
    expect(page).to have_content 'Your account has been updated successfully'
  end

  scenario 'user sucessfully changes password' do
    visit edit_user_registration_path

    fill_in 'Password', with: '1335663'
    fill_in 'Password confirmation', with: '1335663'
    fill_in "Current password", with: 'password'

    click_button 'Update'
    expect(page).to have_content 'Your account has been updated successfully'
  end

  scenario 'user unsuccessfully changes email with invalid password' do
    visit edit_user_registration_path

    fill_in 'Email', with: 'differentemail@gmail.com'
    fill_in "Current password", with: 'passwrd'

    click_button 'Update'
    expect(page).to have_content 'Current password is invalid'
  end

  scenario 'user unsucessfully changes password' do
    visit edit_user_registration_path
    fill_in 'Password', with: 'example'
    fill_in 'Password confirmation', with: 'examlll'
    click_button 'Update'

    expect(page).to have_content "doesn't match"
  end

end
