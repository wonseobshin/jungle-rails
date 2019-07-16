require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should allow you to create user with good params' do
      user1 = User.create email: 'unique1@test.com', name: 'Santa Claus', password: 'secure', password_confirmation: 'secure'
      user2 = User.create email: 'unique2@test.com', name: 'Santa Claus', password: 'secure', password_confirmation: 'secure'
  
      expect(user2).to be_valid
    end

    it 'should not allow you to create user with existing email' do
      user1 = User.create email: 'unique1@test.com', name: 'Santa Claus', password: 'secure', password_confirmation: 'secure'
      user2 = User.create email: 'unique1@test.com', name: 'Santa Claus', password: 'secure', password_confirmation: 'secure'
  
      expect(user2).to_not be_valid
    end

    it 'should not allow you to create user with existing email with different letter case' do
      user1 = User.create email: 'unique1@TEST.com', name: 'Santa Claus', password: 'secure', password_confirmation: 'secure'
      user2 = User.create email: 'UNIQUE1@test.com', name: 'Santa Claus', password: 'secure', password_confirmation: 'secure'
  
      expect(user2).to_not be_valid
    end

    it 'should not allow you to create user when passwords dont match' do
      user1 = User.create email: 'unique1@test.com', name: 'Santa Claus', password: 'secure', password_confirmation: 'notsecure'
      user2 = User.create email: 'unique2@test.com', name: 'Santa Claus', password: 'secure', password_confirmation: 'notsecure'
  
      expect(user2).to_not be_valid
    end

    it 'should not allow you to create user with no name' do
      user = User.create email: 'unique1@test.com', password: 'secure', password_confirmation: 'secure'
  
      expect(user).to_not be_valid
    end

    it 'should not allow you to create user with no email' do
      user = User.create name: 'Santa Claus', password: 'secure', password_confirmation: 'secure'
  
      expect(user).to_not be_valid
    end

    it 'should not allow you to create user with no email' do
      user = User.create email: 'unique@test.com', name: 'Santa Claus', password: 'sec', password_confirmation: 'sec'
  
      expect(user).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    it 'should allow you to log in with right creds' do
      user = User.create email: 'unique@test.com', name: 'Santa Claus', password: 'secure', password_confirmation: 'secure'
      user_login = User.authenticate_with_credentials email: 'unique@test.com', password: 'secure' 
  
      expect(user_login).to eq user
    end

    it 'should allow you to log in with right creds even with whitespace' do
      user = User.create email: 'unique@test.com', name: 'Santa Claus', password: 'secure', password_confirmation: 'secure'
      user_login = User.authenticate_with_credentials email: ' unique@test.com ', password: 'secure' 
  
      expect(user_login).to eq user
    end

    it 'should not allow you to log in with incorrect password' do
      user = User.create email: 'unique@test.com', name: 'Santa Claus', password: 'secure', password_confirmation: 'secure'
      user_login = User.authenticate_with_credentials email: 'unique@test.com', password: 'wrong' 
  
      expect(user_login).to be nil
    end

    it 'should not allow you to log in with incorrect email' do
      user = User.create email: 'unique@test.com', name: 'Santa Claus', password: 'secure', password_confirmation: 'secure'
      user_login = User.authenticate_with_credentials email: 'wrong@test.com', password: 'secure' 
  
      expect(user_login).to be nil
    end
  end
end
