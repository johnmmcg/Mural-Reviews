# require 'rails_helper'
#
# feature "user sees a list of murals" do
#   scenario "sees a list of mural photos and link for new mural" do
#
#
#
#
#     user = User.create(username: 'johnmcg', email: 'johnmcg@gmail.com', password: 'password')
#     big_fish = Mural.create(name: 'Big Fish', location: 'Martin Luther King Dr', user_id: user.id, description: "This is a description", rating: '4', photo_url: 'http://www.petsmart.com/learning-center/fish-care/the-right-food-to-feed-your-fish/A0009.html')
#     mountain = Mural.create(name: 'Mountain', location: 'Walnut St', user_id: user.id, description: "This is another description", rating: '2', photo_url: 'https://pixabay.com/en/prairie-highway-the-scenery-679016/')
#     visit root_path
#     expect(page).to have_link "Big Fish"
#     expect(page).to have_link "Mountain"
#     expect(page).to have_content "Number of Reviews:"
#     expect(page).to have_content "Average Rating:"
#     expect(page).to have_content "Add New Mural"
#   end
#
#   scenario "clicks link and is taken to show page for given mural" do
#     user = User.create(username: 'johnmcg', email: 'johnmcg@gmail.com', password: 'password')
#     big_fish = Mural.create(name: 'Dorothy', location: 'The land of Oz', user_id: user.id, description: "This is a description", rating: '4', photo_url: 'http://images2.fanpop.com/image/quiz/400000/400752_1271413686448_431_300.jpg')
#
#     visit root_path
#
#     expect(page).to have_link "Dorothy"
#     click_link "Dorothy"
#
#     expect(page).to have_content big_fish.name
#     expect(page).to have_content big_fish.location
#     expect(page).to have_content big_fish.average_rating
#     expect(page).to have_content big_fish.description
#     expect(page).to have_xpath('//img[@src="http://images2.fanpop.com/image/quiz/400000/400752_1271413686448_431_300.jpg"]')
#   end
# end
