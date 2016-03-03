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

  scenario 'user can delete a review' do
    visit '/restaurants'
    user_signup
    leave_review
    click_link 'Delete Review'
    expect(page).not_to have_content 'so so'
  end

  scenario 'user can only delete their own review' do
    visit '/restaurants'
    user_signup
    leave_review
    click_link 'Sign out'
    user2_signup
    click_link 'Delete Review'
    expect(page).to have_content('You can only delete reviews you created')
  end

  scenario 'displays an average rating for all reviews' do
    add_review('So so', '3')
    add_review('Great', '5')
    expect(page).to have_content('Average rating: 4')
  end

end
