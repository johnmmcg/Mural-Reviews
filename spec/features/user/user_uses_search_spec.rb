# require 'rails_helper'
#
# feature "search bar" do
#   before(:each) do
#     @user1 = User.create(username: "User1", password: "password", email: "example1@gmail.com")
#
#     visit new_user_session_path
#
#     fill_in 'Email', with: "example1@gmail.com"
#     fill_in 'Password', with: "password"
#     click_button 'Log in'
#   end
#
#   scenario "User searches for mural" do
#     mural_example = Mural.create(name: "example mural", description: "description of example mural", rating: "1", location: "1234 Street Road", photo_url: "wwww.image.com/example", user_id: @user1.id )
#
#     visit root_path
#
#     fill_in 'Search', with: 'example mural'
#
#
#
#     expect(page).to have_link 'example mural'
#   end
#
# end
