require "rails_helper"

feature "profile photo" do
  scenario "user uploads a profile photo" do
    visit root_path
    click_link "Sign Up"
    fill_in "Username", with: "andrew"
    fill_in "Email", with: "ash@s-mart.com"
    fill_in "Password", with: "boomstick!3vilisd3ad"
    fill_in "Password Confirmation", with: "boomstick!3vilisd3ad"
    attach_file :user_profile_photo, File.join(Rails.root, 'spec', 'support', 'images', 'cat-bonnet_small.jpg')
    click_button "Sign up"
    expect(page).to have_css("img[src*='cat-bonnet_small.jpg']")

  end

  scenario "user changes their profile photo" do
    User.create(username: 'johnmcg', email: 'johnmcg@gmail.com', password: 'password')

    visit root_path
    click_link "Sign In"
    fill_in "Email", with: "johnmcg@gmail.com"
    fill_in "Password", with: "password"

    click_button "Log in"
    click_link "Edit Profile"
    fill_in "Current password", with: "password"
    attach_file :user_profile_photo, File.join(Rails.root, 'spec', 'support', 'images', 'cat-bonnet_small.jpg')

    click_button "Update"
    expect(page).to have_content("Your account has been updated successfully")
    expect(page).to have_css("img[src*='cat-bonnet_small.jpg']")
  end
end
