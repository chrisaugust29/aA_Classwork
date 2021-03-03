require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.create!(username: 'something', email: 'something@something.com', password: 'something123', session_token: 'drctfvghbjk')}
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

  describe '#is_password?' do
    let(:user) { FactoryBot.build(:user)}
    context 'with a valid password' do 
      it 'should return true' do 
        expect(user.is_password?('password')).to be true
      end
    end

    context 'with an invalid password' do 
        it 'should return false' do 
        expect(user.is_password?('passworddd')).to be false
        end
    end
  end


  describe 'password_encryption' do 
    it 'does not save password to database' do 
      FactoryBot.create(:esport) 
      user = User.find_by(username: 'On Bush')
      expect(user.password).not_to eq ('fgvhbjnkml')
    end
      it 'Encrypts password using BCrypts' do 
        expect(BCrypt::Password).to receive(:create).with('anything')
        FactoryBot.build(:user, password: 'anything')
      end
    
  end


end
