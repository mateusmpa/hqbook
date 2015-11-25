require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#follow!' do
    it 'user follows another user' do
      user = create(:user)
      another = create(:user, email: 'another@test.com')

      user.follow! another

      expect(user.followers).to eq [another]
    end

    it 'user has many followers' do
      user = create(:user)
      followers = []
      3.times do |n|
        followers << create(:user, email: "followers#{n}@test.com")
        user.followers << followers[n]
      end

      expect(user.followers).to eq followers
    end

    it 'user can not follow himself' do
      user = create(:user)

      user.follow! user

      expect(user.followers).to eq []
    end
  end
end
