require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do

    it { should validate_pressence_of(:username)}
    it { should validate_pressence_of(:email)}
    it { should validate_pressence_of(:password_digest)}
    it { should validate_pressence_of(:session_token)}
    it { should validate_length_of(:password).is_at_least(7)}

    it { should validate_uniqueness_of(:username)}
    it { should validate_uniqueness_of(:email)}

  end
  describe 'associations' do
    it { should have_many(:goals)}
    it { should have_many(:cheers)}
    it { should have_many(:cheered_goals)}

  end
end
