require 'rails_helper'

describe 'users index page' do
  context 'no users signed in' do
    it 'should display a message' do
      visit '/users'
      expect(page).to have_content 'not signed in'
    end
  end
end
