require 'spec_helper'

describe 'when a visitor goes to the homepage' do
  context 'they have not clicked anywhere yet' do
    it 'Has the name of the website displayed' do
      visit root_path
      page.should have_content "Awww Therapy"
    end
  end

  context 'they want to sign up for an account' do
    it 'displays the sign up form' do
      visit root_path
      click_on "Sign Up"
      page.should have_content "Password confirmation"
    end

    it 'has a link to the main page' do
      visit root_path
      click_on "Sign Up"
      page.should have_content "Main Page"
    end
  end
end



