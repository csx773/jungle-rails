require 'rails_helper'

RSpec.describe User, type: :model do
  #  pending "add some examples to (or delete) #{__FILE__}"

  describe "Validations" do
    subject { described_class.new(
      first_name: 'Ben',
      last_name: 'Chen',
      email: 'ben@test.com',
      password: 'test123',
      password_confirmation: 'test123'
    ) }

    it 'should save valid user' do
      expect(subject.save!).to be true
    end
  
    it 'should have password and password_confirmation match' do
      subject.password = 'test555'
      subject.password_confirmation = 'test555'

      expect(subject).to be_valid
    end

    it 'should have password and password_confirmation not match' do
      subject.password = 'test999'
      subject.password_confirmation = 'test'

      expect(subject).to_not be_valid
    end

    it 'should have email be unique and not case sensitive' do      
      subject.save!
      @user2 = User.new(
        first_name: 'Ben',
        last_name: 'Chen',
        email: 'BEN@TEST.com',
        password: 'test123',
        password_confirmation: 'test123'
      )
      
      expect(@user2).to_not be_valid
    end

    it 'should have presence of email, first name, last name' do
      subject.email = 'someone@test.com'
      subject.first_name = 'some'
      subject.last_name = 'one'

      expect(subject).to be_valid
    end

    it 'should have password have length >= 3' do
      @user = User.new(
        first_name: 'Ben',
        last_name: 'Chen',
        email: 'user@test.com',
        password: 'tes',
        password_confirmation: 'tes'
      )

      expect(@user.password.length).to be >= 3
      expect(@user.password_confirmation.length).to be >= 3

    end
    
  end

  describe '.authenticate_with_credentials' do

    subject { described_class.create(
      first_name: 'Ben',
      last_name: 'Chen',
      email: 'ben@test.com',
      password: 'test123',
      password_confirmation: 'test123'
    )}

    # examples for this class method here
    it 'should return user with correct email and password' do
      user = User.new(
        first_name: 'Sam',
        last_name: 'Wong',
        email: 'sam@test.com',
        password: 'test111',
        password_confirmation: 'test111'
      )
      user.save!
      
      @email = user.email
      @password = user.password

      expect(User.authenticate_with_credentials(@email, @password).present?).to eq(true)

    end
    
    it 'should return nil with incorrect email and correct password' do
      user = User.new(
        first_name: 'Sam',
        last_name: 'Wong',
        email: 'sam@test.com',
        password: 'test111',
        password_confirmation: 'test111'
      )
      user.save!
      
      @email = user.email
      @password = 'wrongpass'
      expect(User.authenticate_with_credentials(@email, @password)).to eq(nil)

    end

    it 'should return nil with correct email and incorrect password' do
      pending "should return nil with correct email and incorrect password #{__FILE__}"

    end
  
  end
  
end
