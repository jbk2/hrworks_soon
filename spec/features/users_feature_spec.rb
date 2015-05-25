require 'rails_helper'

describe 'home page' do
  it "should display a 'Sign up' prompt" do
    visit '/'
    expect(page).to have_content 'Sign up'
  end
end

describe 'registering a user' do
  context 'with valid data' do
    it 'confirms user registration' do
      visit '/users/new'
      fill_in 'Name here...', with: 'james kemp'
      fill_in 'Your email here...', with: 'test2@test.com'
      click_button 'Notify me'
      expect(current_path).to eq "/users/#{ User.last.id }" #or use path helper: user_path(User.last)
      expect(page).to have_content "james"
      expect(page).not_to have_content "Sign up"
    end
  end

  context 'with invalid data' do
    it 'without correct email' do
      visit '/'
      fill_in 'Name here...', with: 'ja'
      fill_in 'Your email here...', with: 'test2'
      click_button 'Notify me'
      
      expect(page).to have_content 'errors'
    end
  end
end

