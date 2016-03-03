require 'rails_helper'
require 'web_helper'

feature 'reviewing' do
  before {Restaurant.create name: 'KFC'}

  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
    leave_review
  end

  scenario 'only lets user edit reviews that they have created' do
    visit '/restaurants'
    user_signup
    leave_review
    click_link 'Sign out'
    user2_signup
    click_link 'Review KFC'
    expect(page).to have_content 'You can only edit reviews you created'
  end
end
