require 'rails_helper'

RSpec.describe Favourite, type: :model do

  describe "association with user" do
    let(:user) { create :user }

    it "belongs to a user" do
      favourite = user.favourites.new(group_name: "Whatever")

      expect(favourite.user).to eq(user)
    end
  end

end
