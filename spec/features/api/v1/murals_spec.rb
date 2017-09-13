require 'rails_helper'

feature 'murals api' do
  before(:each) do
    User.create(username: "super_admin", password: "password", email: "admin@gmail.com", admin: true)
    @user = User.create(username: "notanadmin", password: "password1234", email: "notanadmin@gmail.com")
    @mural = Mural.create(name: 'Big Fish', location: 'Martin Luther King Dr', user_id: @user.id, description: "This is a description", rating: '4', photo_url: 'http://www.petsmart.com/learning-center/fish-care/the-right-food-to-feed-your-fish/A0009.html')
    @mural2 = Mural.create(name: 'Big Dog', location: 'Somewhere', user_id: @user.id, description: "This is a description", rating: '5', photo_url: 'google.com/image.png')
    Review.create(rating: 2, review: "This is a bad review", user_id: @user.id, mural_id: @mural.id)
  end

  scenario 'User accesses murals api info' do
    visit api_v1_murals_path

    expect(page).to have_content "id"
    expect(page).to have_content "name"
    expect(page).to have_content "location"

    expect(page).to have_content "Big Dog"
    expect(page).to have_content "Somewhere"
    expect(page).to have_content "This is a description"
  end

  scenario 'User accesses individual mural info' do
    visit api_v1_mural_path(@mural.id)

    expect(page).to have_content "review"
    expect(page).to have_content "user"
    expect(page).to have_content "mural"

    expect(page).to have_content "This is a bad review"
    expect(page).to have_content "2"
  end
end
