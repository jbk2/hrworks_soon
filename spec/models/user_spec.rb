require 'rails_helper'

describe User do
  # before do
  #   user = create(:user)
  # end
  it 'creating a user instance without a name' do
    user = User.new(name: nil)
    expect(user).to have(2).errors_on(:name)
  end

  it 'creating a user instance with name of <3 chars' do
    user = User.new(name: 'ab')
    expect(user).to have(1).errors_on(:name)
  end

  it 'creating a user instance without an email address' do
    user = User.new(name: 'abc', email: nil)
    expect(user).to have(2).errors_on(:email)
  end

  it 'creating a user instance with an invalid email address' do
    user = User.new(name: 'abc', email: 'test.com')
    expect(user).to have(1).errors_on(:email)
  end
end