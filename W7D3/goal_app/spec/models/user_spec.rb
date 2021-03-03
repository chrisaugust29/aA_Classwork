require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.create!(username: 'something', email: 'something@something.com', password: 'something123')}
  describe 'validations' do

    it { should validate_presence_of(:username)}
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:password_digest)}
    it { should validate_presence_of(:session_token)}

    it { should validate_uniqueness_of(:username)}
    it { should validate_uniqueness_of(:email)}

  end
  describe 'associations' do
    it { should have_many(:goals)}
    it { should have_many(:cheers)}
    it { should have_many(:cheered_goals)}

  end
end
