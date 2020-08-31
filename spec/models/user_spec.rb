require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Valiations' do
    it 'expect user to be valid' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end
  end

  describe 'Asociation' do
    it { should have_many(:memos) }
    it { should have_many(:active_friendships).class_name('Friendship').with_foreign_key('follower_id').dependent(:destroy) }
    it { should have_many(:following).through(:active_friendships).source(:followed) }
    it { should have_many(:passive_friendships).class_name('Friendship').with_foreign_key('followed_id').dependent(:destroy) }
    it { should have_many(:followers).through(:passive_friendships).source(:follower) }
  end
end 