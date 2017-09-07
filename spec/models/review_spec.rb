require 'rails_helper'

RSpec.describe Review, type: :model do
  describe Review do
    it { should have_valid(:rating).when("an@email.com")}
    it { should_not have_valid(:rating).when(nil, "")}

    it {should have_valid(:review).when("This is a description")}
    it {should_not have_valid(:review).when(nil, "")}
  end
end
