def create_user_and_sign_in
  user = FactoryGirl.create(:user)
  visit new_user_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Login'
end
