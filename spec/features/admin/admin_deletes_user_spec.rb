require 'rails_helper'

feature 'admin deletes a user' do

  before(:each) do
    User.create(username: "super_admin", password: "password", email: "admin@gmail.com", admin: true)
    user = User.create(username: "notanadmin", password: "password1234", email: "notanadmin@gmail.com")
    mural = Mural.create(name: 'Big Fish', location: 'Martin Luther King Dr', user_id: user.id, description: "This is a description", rating: '4', photo_url: 'http://www.petsmart.com/learning-center/fish-care/the-right-food-to-feed-your-fish/A0009.html')
    Review.create(rating: 2, review: "This is a bad review", user_id: user.id, mural_id: mural.id)

    visit new_user_session_path

    fill_in 'Email', with: "admin@gmail.com"
    fill_in 'Password', with: "password"
    click_button 'Log in'
  end

  scenario 'delete a user' do
    User.create(username: "notanadmin", password: "password1234", email: "notanadmin@gmail.com")

    visit root_path

    click_link 'Users Index'
    expect(page).to have_content "notanadmin"
    click_link 'notanadmin'
    click_button 'Delete User'

    expect(page).to_not have_content "notanadmin"
    visit root_path
    expect(page).to_not have_content "Big Fish"

  end


  # scenario 'delete a mural' do
  #
  #   visit `/mural/#{Mural.find_by(name: 'Big Fish')}`
  #
  #
  #   click_button 'Delete Mural'
  #
  #
  #   expect(page).to_not have_content "Big Fish"
  # end
  #
  # scenario 'delete a review' do
  #   visit root_path
  #   click_link 'Big Fish'
  #   click_button 'Delete Review'
  #
  #   expect(page).to_not have_content "This is a bad review"
  # end

end






# require 'rails_helper'
#
# feature 'admin deletes a user, mural and review' do
#
#   before(:each) do
#     User.create(username: "super_admin", password: "password", email: "admin@gmail.com", admin: true)
#     user = User.create(username: "notanadmin", password: "password1234", email: "notanadmin@gmail.com")
#     mural = Mural.create(name: 'Big Fish', location: 'Martin Luther King Dr', user_id: user.id, description: "This is a description", rating: '4', photo_url: 'http://www.petsmart.com/learning-center/fish-care/the-right-food-to-feed-your-fish/A0009.html')
#     Review.create(rating: 2, review: "This is a bad review", user_id: user.id, mural_id: mural.id)
#
#     visit new_user_session_path
#
#     fill_in 'Email', with: "admin@gmail.com"
#     fill_in 'Password', with: "password"
#     click_button 'Log in'
#   end
#
#   scenario 'delete a user' do
#     User.create(username: "notanadmin", password: "password1234", email: "notanadmin@gmail.com")
#
#     visit root_path
#
#     click_link 'Users Index'
#     expect(page).to have_content "notanadmin"
#     click_link 'notanadmin'
#     click_button 'Delete User'
#
#     expect(page).to_not have_content "notanadmin"
#     visit root_path
#     expect(page).to_not have_content "Big Fish"
#
#   end
#
#
#   scenario 'delete a mural' do
#     visit root_path
#     click_link 'Big Fish'
#     click_button 'Delete Mural'
#
#     expect(page).to_not have_content "Big Fish"
#   end
#
#   scenario 'delete a review' do
#     visit root_path
#     click_link 'Big Fish'
#     click_button 'Delete Review'
#
#     expect(page).to_not have_content "This is a bad review"
#   end
#
# end
