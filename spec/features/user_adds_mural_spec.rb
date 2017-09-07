require 'spec_helper'
require 'rails_helper'

feature 'user adds mural;
  As a user
  I want to add a mural
  So that I can share a mural' do

  scenario 'user tries to add a mural without being signed in' do
    user = User.create(username: 'johnmcg', email: 'johnmcg@gmail.com', password: 'password')
    big_fish = Mural.create(name: 'Big Fish', location: 'Martin Luther King Dr', user_id: user.id, description: "This is a description", rating: '4', photo_url: 'http://www.petsmart.com/learning-center/fish-care/the-right-food-to-feed-your-fish/A0009.html')

    visit root_path
    click_link 'Add New Mural'

    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end


  scenario 'user adds a mural while signed in' do
    user = User.create(username: 'johnmcg', email: 'johnmcg@gmail.com', password: 'password')
    big_fish = Mural.create(name: 'Big Fish', location: 'Martin Luther King Dr', user_id: user.id, description: "This is a description", rating: '4', photo_url: 'http://www.petsmart.com/learning-center/fish-care/the-right-food-to-feed-your-fish/A0009.html')
    visit new_user_session_path

    fill_in 'Email', with: "johnmcg@gmail.com"
    fill_in 'Password', with: "password"
    click_button 'Log in'

    click_link 'Add New Mural'

    fill_in 'Name', with: "Mural Name"
    fill_in 'Location', with: "Broad Street, Philadelphia"
    fill_in 'Description', with: "This is a description"
    fill_in 'Rating', with: 4
    fill_in 'Photo url', with: "Google.com"

    click_button "Add Mural"

    expect(page).to have_content("Mural added successfully")
  end

end