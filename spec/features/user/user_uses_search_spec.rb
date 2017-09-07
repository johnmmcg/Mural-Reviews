require 'rails_helper'

feature "search bar" do
  before(:each) do
    @user1 = User.create(username: "User1", password: "password", email: "example1@gmail.com")
    # @user2 = User.create(username: "User2", password: "password2", email: "example2@gmail.com")

    visit new_user_session_path

    fill_in 'Email', with: "example1@gmail.com"
    fill_in 'Password', with: "password"
    click_button 'Log in'
  end
  #
  # scenario "User searches for another user" do
  #   visit root_path
  #
  #   fill_in 'Search', with: 'User2'
  #
  #   click_button 'Search'
  #
  #   expect(page).to have_content 'User2'
  # end

  #
  scenario "User searches for mural" do
    mural_example = Mural.create(name: "example mural", description: "description of example mural", rating: "1", location: "1234 Street Road", photo_url: "wwww.image.com/example", user_id: @user1.id )

    visit root_path

    fill_in 'Search Murals', with: 'example mural'

    click_button 'Search'

    expect(page).to have_link 'example mural'
  end
  #
  # scenario "User searches for a review" do
  #   mural_example2 = Mural.create(name: "example mural 2", description: "description of example mural 2", rating: "2", location: "5678 Street Road", photo_url: "wwww.image.com/example2", user_id: @user1.id )
  #   review_example = Review.create(user_id: @user1.id, review: "This mural is great!", rating: "4")
  #
  #   visit root_path
  #
  #   fill_in 'Search', with: 'This mural is great!'
  #
  #   click_button 'Search'
  #
  #   expect(page).to have_content 'This mural is great!'
  # end

end
