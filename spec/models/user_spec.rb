require 'rails_helper'

describe User do
  # before do
  #   user = create(:user)
  # end
  it 'creating a user instance without a name' do
    user = User.new(first_name: nil, last_name: nil)
    expect(user).to have(1).errors_on(:first_name)
  end

  it 'creating a user instance without an email address' do
    user = User.new(first_name: 'abc', last_name: 'def', email: nil)
    expect(user).to have(2).errors_on(:email)
  end

  it 'creating a user instance with an invalid email address' do
    user = User.new(first_name: 'abc', last_name: 'def', email: 'test.com')
    expect(user).to have(1).errors_on(:email)
  end
end