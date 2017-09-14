# require "rails_helper"
#
# feature "Review email notice" do
#   scenario "user recieves an email stating their posted mural was given a review" do
#     # Clear out any previously delivered emails
#     ActionMailer::Base.deliveries.clear
#
#     user = User.create(username: 'johnmcg', email: 'johnmcg@gmail.com', password: 'password')
#     big_fish = Mural.create(name: 'Big Fish', location: 'Martin Luther King Dr', user_id: user.id, description: "This is a description", rating: '4', photo_url: 'http://www.petsmart.com/learning-center/fish-care/the-right-food-to-feed-your-fish/A0009.html')
#
#     visit new_user_session_path
#
#     fill_in 'Email', with: "johnmcg@gmail.com"
#     fill_in 'Password', with: "password"
#     click_button 'Log in'
#
#     visit new_mural_review_path(big_fish)
#
#     fill_in "Review", with: "Total garbage."
#     fill_in "Rating", with: "3"
#
#     click_button "Add Review"
#
#     expect(page).to have_content("Total garbage.")
#     expect(page).to have_content("3")
#     expect(ActionMailer::Base.deliveries.count).to eq(1)
#   end
# end
