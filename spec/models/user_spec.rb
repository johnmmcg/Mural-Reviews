require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    it {should have_valid(:username).when("Johnmcg5")}
    it {should_not have_valid(:username).when(nil, "")}

    it { should have_valid(:email).when("an@email.com")}
    it { should_not have_valid(:email).when(nil, "", "notagoodemail")}

    it {should have_valid(:password).when("password")}
    it {should_not have_valid(:password).when(nil, "")}

    it 'has a matching password confirmation for the password' do
      user = User.new
      user.password = 'password'
      user.password_confirmation = 'differentpassword'

      expect(user).to_not be_valid
      expect(user.errors[:password_confirmation]).to_not be_blank
    end
  end
end
