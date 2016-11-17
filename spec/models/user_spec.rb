require 'rails_helper'

RSpec.describe User, type: :model do

  describe "association with favourites" do
    let(:user) { create :user }
    let!(:favourite) { create :favourite, user: user }

    it "has many favourites" do
      favourite1 = user.favourites.new(group_name: "Something")
      favourite2 = user.favourites.new(group_name: "Another")

      expect(user.favourites).to include(favourite1)
      expect(user.favourites).to include(favourite2)
    end

    it "deletes associated favourites" do
      expect { user.destroy }.to change(Favourite, :count).by(-1)
    end
  end

end
