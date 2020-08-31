require 'rails_helper'

RSpec.describe Memo, type: :model do
    describe 'validations' do
        it { should validate_presence_of(:body) }
      end

  describe 'Asociation' do
    it { should belong_to(:user) }
  end
end 