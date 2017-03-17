def sign_in(user)
  visit '/users/sign_in'
  fill_in 'Email', with: user.email
  fill_in 'Password', with: PW
  click_button 'Log in'
end
