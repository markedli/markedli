Given /^I have a user account$/ do
  @user = Factory(:user)
end

Given /^A user account exists$/ do
  @user = Factory(:user)
end

Given /^I am logged out$/ do
  visit '/users/sign_out'
end

Given /^I am a guest$/ do
  visit '/users/sign_out'
end

Given /^I am logged in$/ do
  @user = Factory(:user)
  visit '/users/sign_in'

  fill_in 'Username or email', :with => @user.username
  fill_in 'Password', :with => @user.password

  click_button "Sign in"
end

When /^I create a user account$/ do
  visit '/users/sign_up'

  fill_in 'Username', :with => "testing"
  fill_in 'Email', :with => "testing@test.com"
  fill_in 'Password', :with => "simplepass"
  fill_in 'Password confirmation', :with => "simplepass"

  click_button "Sign up"
end

When /^I create a user account with a taken email$/ do
  visit '/users/sign_up'

  fill_in 'Username', :with => "testing"
  fill_in 'Email', :with => @user.email
  fill_in 'Password', :with => "newpass"
  fill_in 'Password confirmation', :with => "newpass"

  click_button "Sign up"
end

When /^I create a user account with a taken username$/ do
  visit '/users/sign_up'

  fill_in 'Username', :with => @user.username
  fill_in 'Email', :with => "someother@email.com"
  fill_in 'Password', :with => "newpass"
  fill_in 'Password confirmation', :with => "newpass"

  click_button "Sign up"
end
When /^I sign in using my email$/ do
  visit '/users/sign_in'

  fill_in 'Username or email', :with => @user.email
  fill_in 'Password', :with => @user.password

  click_button "Sign in"
end

When /^I sign in using my username$/ do
  visit '/users/sign_in'

  fill_in 'Username or email', :with => @user.username
  fill_in 'Password', :with => @user.password

  click_button "Sign in"
end

When /^I sign in$/ do
  visit '/users/sign_in'

  fill_in 'Username or email', :with => @user.username
  fill_in 'Password', :with => @user.password

  click_button "Sign in"
end

Then /^I should be notified of my new account$/ do
  find('#flash_notice').should have_content('You have signed up successfully')
end

Then /^I am signed in$/ do
  find('#flash_notice').should have_content('Signed in successfully.')
end

Then /^I should be notified of an error$/ do
  find('#error_explanation').should have_content('prohibited this user from being saved')
end
