require 'spec_helper'
require 'rails_helper'

feature 'user adds mural;
  As a user
  I want to add a mural
  So that I can share a mural' do

  scenario 'user tries to add a mural without being signed in' do
    visit root_path
    click_link 'Add New Mural'

    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end


  xscenario 'user adds a mural with a photo url while signed in' do
    User.create(username: 'johnmcg', email: 'johnmcg@gmail.com', password: 'password')
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

  xscenario 'user adds a mural with a photo attachment while signed in' do
    User.create(username: 'johnmcg', email: 'johnmcg@gmail.com', password: 'password')
    visit new_user_session_path

    fill_in 'Email', with: "johnmcg@gmail.com"
    fill_in 'Password', with: "password"
    click_button 'Log in'

    click_link 'Add New Mural'

    fill_in 'Name', with: "Mural Name"
    fill_in 'Location', with: "Broad Street, Philadelphia"
    fill_in 'Description', with: "This is a description"
    fill_in 'Rating', with: 4
    attach_file :mural_mural_upload, File.join(Rails.root, 'spec', 'support', 'images', 'cat-bonnet_small.jpg')

    click_button "Add Mural"

    expect(page).to have_content("Mural added successfully")
  end


  xscenario 'user attempts to add a mural while signed in, but provides bad data' do
    user = User.create(username: 'johnmcg', email: 'johnmcg@gmail.com', password: 'password')
    Mural.create(name: 'Big Fish', location: 'Martin Luther King Dr', user_id: user.id, description: "This is a description", rating: '4', photo_url: 'http://www.petsmart.com/learning-center/fish-care/the-right-food-to-feed-your-fish/A0009.html')
    visit new_user_session_path

    fill_in 'Email', with: "johnmcg@gmail.com"
    fill_in 'Password', with: "password"
    click_button 'Log in'

    click_link 'Add New Mural'

    fill_in 'Name', with: "Mural Name"
    fill_in 'Location', with: "Broad Street, Philadelphia"
    fill_in 'Description', with: "This is a description"
    fill_in 'Rating', with: 4

    click_button "Add Mural"

    expect(page).to have_content "Please specify a photo url or upload a mural picture, but not both."
  end

  xscenario 'user can delete the mural she posted' do
    user = User.create(username: 'alex', email: 'alex@gmail.com', password: 'password')
    big_fish = Mural.create(name: 'Big Fish', location: 'Martin Luther King Dr', user_id: user.id, description: "This is a description", rating: '4', photo_url: 'http://www.petsmart.com/learning-center/fish-care/the-right-food-to-feed-your-fish/A0009.html')
    visit new_user_session_path

    fill_in 'Email', with: "alex@gmail.com"
    fill_in 'Password', with: "password"
    click_button 'Log in'

    click_link 'Add New Mural'

    fill_in 'Name', with: "Mural Name"
    fill_in 'Location', with: "Broad Street, Philadelphia"
    fill_in 'Description', with: "This is a description"
    fill_in 'Rating', with: 4
    fill_in 'Photo url', with: "Google.com/image.png"
    click_button "Add Mural"

    visit mural_path(big_fish)

    click_button "Delete Mural"
    expect(page).to have_content "Mural successfully deleted."
  end

end
