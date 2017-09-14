# require 'spec_helper'
# require 'rails_helper'
#
# feature 'user add review;
#   As a user
#   I want to add a review
#   So that I can comment on a mural' do
#
#   scenario 'user tries to add a review without being signed in' do
#     user = User.create(username: 'johnmcg', email: 'johnmcg@gmail.com', password: 'password')
#     big_fish = Mural.create(name: 'Big Fish', location: 'Martin Luther King Dr', user_id: user.id, description: "This is a description", rating: '4', photo_url: 'http://www.petsmart.com/learning-center/fish-care/the-right-food-to-feed-your-fish/A0009.html')
#
#     visit '/mural/#{big_fish.id}'
#     save_and_open_page
#    
#
#     click_link 'Add Review'
#
#     expect(page).to have_content("You need to sign in or sign up before continuing.")
#   end
#
#
#   scenario 'user adds a review while signed in' do
#     user = User.create(username: 'johnmcg', email: 'johnmcg@gmail.com', password: 'password')
#     big_fish = Mural.create(name: 'Big Fish', location: 'Martin Luther King Dr', user_id: user.id, description: "This is a description", rating: '4', photo_url: 'http://www.petsmart.com/learning-center/fish-care/the-right-food-to-feed-your-fish/A0009.html')
#     visit new_user_session_path
#
#     fill_in 'Email', with: "johnmcg@gmail.com"
#     fill_in 'Password', with: "password"
#     click_button 'Log in'
#
#     click_link 'Big Fish'
#     click_link 'Add Review'
#     fill_in 'Review', with: "Here is my review"
#     fill_in 'Rating', with: "4"
#     click_button 'Add Review'
#
#     expect(page).to have_content("Review added successfully")
#   end
#
#   scenario 'user adds a review while signed in, but provides bad data' do
#     user = User.create(username: 'johnmcg', email: 'johnmcg@gmail.com', password: 'password')
#     big_fish = Mural.create(name: 'Big Fish', location: 'Martin Luther King Dr', user_id: user.id, description: "This is a description", rating: '4', photo_url: 'http://www.petsmart.com/learning-center/fish-care/the-right-food-to-feed-your-fish/A0009.html')
#     visit new_user_session_path
#
#     fill_in 'Email', with: "johnmcg@gmail.com"
#     fill_in 'Password', with: "password"
#     click_button 'Log in'
#
#     click_link 'Big Fish'
#     click_link 'Add Review'
#     fill_in 'Review', with: "Here is my review"
#     click_button 'Add Review'
#
#     expect(page).to have_content("can't be blank")
#   end
# end
