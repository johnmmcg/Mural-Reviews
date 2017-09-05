require 'rails_helper'

feature "user sees a list of murals" do
  scenario "sees a list of mural photos and link for new mural" do
    big_fish = Mural.create(name: 'Big Fish', location: 'Martin Luther King Dr', average_rating: '4', photo_url: 'http://www.petsmart.com/learning-center/fish-care/the-right-food-to-feed-your-fish/A0009.html')
    mountain = Mural.create(name: 'Mountain', location: 'Walnut St', average_rating: '2', photo_url: 'https://pixabay.com/en/prairie-highway-the-scenery-679016/')

    visit murals_path

    expect(page).to have_content "Big Fish"
    expect(page).to have_link "Mountain"

    click_link "Add New Mural"

    expect(page).to have_content "Add a New Mural"
  end

  scenario "clicks link and is taken to show page for given mural" do
    big_fish = Mural.create(name: 'Big Fish', location: 'Martin Luther King Dr', average_rating: '4', photo_url: 'http://images2.fanpop.com/image/quiz/400000/400752_1271413686448_431_300.jpg')

    visit root_path

    click_link "Big Fish"

    expect(page).to have_content big_fish.name
    expect(page).to have_content big_fish.location
    expect(page).to have_content big_fish.average_rating
    expect(page).to have_xpath('//img[@src="http://images2.fanpop.com/image/quiz/400000/400752_1271413686448_431_300.jpg"]')
  end
end
