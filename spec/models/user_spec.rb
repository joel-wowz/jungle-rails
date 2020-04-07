require 'rails_helper'

RSpec.describe User, type: :model do
 before(:each) do
  @user = User.new(first_name: 'big', last_name: 'daddy',email: 'test@test.com', password: 'pass123', password_confirmation: 'pass123')
 end


describe 'Validations' do
 it 'returns valid if all params exist' do
    expect(@user).to be_valid
 end


 it 'should return false if passwords dont match' do
  @user.password = 'yo'
  @user.password_confirmation = 'swag'
  expect(@user).to_not be_valid
  end


  it 'should not work with non-unique emails' do
    user = User.create!(first_name: 'big', last_name:'ronald', email: 'TEST@test.com', password:'gummies',password_confirmation:'gummies')
    expect(@user).to_not be_valid
  end

end
  

describe '.authenticate_with_credentials' do
   it 'should login in sucessful cred' do
    @user.save
    auth = @user.authenticate_with_credentials(@user.email, @user.password)
    expect(auth).to eql(@user)
   end

  it 'should not login with invalid creds' do
    @user.save
    failed_attempt = @user.authenticate_with_credentials(@user.email, @user.password = 'lol')
   end

  xit 'should auth after user adds spaces' do
    @user.save
    add_space = User.authenticate_with_credentials(@user.email = ' test@test.com ', @user.password)
    expect(add_space).to eql(@user)
    end
    
    
  xit 'should not care about case-sens' do
    @user.save
    case_sens = User.authenticate_with_credentials(@user.email = 'TEST@teSt.cOm', @user.password)
    expect(case_sens).to eql(@user)
    end
  end
 end