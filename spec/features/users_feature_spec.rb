require 'rails_helper'
# require 'time'

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
      expect(page).to have_content "James"
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

describe 'greeting a newly registered user' do
  before do 
    Timecop.freeze(Time.now.beginning_of_day + 11.hours)
  end

  it 'tailors the greeting to the time of day' do
      visit '/'
      fill_in 'Name here...', with: 'test name'
      fill_in 'Your email here...', with: 'test@test.com'
      click_button 'Notify me'

      expect(page).to have_content 'Morning'
  end

  it 'uses only your first name, capitalised, in the greeting' do
    visit '/'
    fill_in 'Name here...', with: 'test name'
    fill_in 'Your email here...', with: 'test@test.com'
    click_button 'Notify me'

    expect(page).to_not have_content 'name'
    expect(page).to have_content 'Test'
  end
end


describe 'signup welcome email' do
  before do
    clear_emails
  end

  it 'is sent upon successful signup' do
    create(:user)
    open_email('test1@test.com')
    expect(current_email).to have_content 'Welcome John' 
    expect(current_email).to_not have_content 'Doe'
    expect(current_email.subject).to have_content 'Welcome to hrworks.io' 
  end
end


