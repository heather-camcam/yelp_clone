require 'rails_helper'
require 'web_helper'

feature 'reviewing' do
  before {Restaurant.create name: 'KFC'}

  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
    leave_review
  end

  scenario 'only lets users create one review per restaurant' do
    visit '/restaurants'
    user_signup
    leave_review
    leave_review2
    expect(page).not_to have_content 'amazeballs'
  end
end
