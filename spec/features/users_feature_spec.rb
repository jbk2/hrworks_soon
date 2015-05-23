require 'rails_helper'


describe 'users index page' do
  context 'no users signed in' do
    it 'should display a message' do
      visit '/users'
      expect(page).to have_content 'Sign up'
    end
  end
end

describe 'registering a user' do
  it 'confirms user registration' do
    visit '/users/new'
    fill_in 'Name here...', with: 'test name'
    fill_in 'Your email here...', with: 'test2@test.com'
    click_button 'Notify me'
    # expect(current_path).to eq '/users/@user.id'
    expect(page).to have_content "Welcome test2@test.com"
    expect(page).not_to have_content "Sign up"
  end
end

