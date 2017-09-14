require 'rails_helper'

RSpec.describe Mural, type: :model do
  describe Mural do
    it {should have_valid(:name).when("Philly Mural")}
    it {should_not have_valid(:name).when(nil, "")}

    it { should have_valid(:location).when("123 North Pole")}
    it { should_not have_valid(:location).when(nil, "")}

    it {should have_valid(:photo_url).when("url")}

    it {should have_valid(:description).when("this is a description")}
    it {should_not have_valid(:description).when(nil, "")}
  end
end
