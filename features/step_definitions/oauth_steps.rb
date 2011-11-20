Given /^I have created a client application$/ do
  @application_key, @application_secret = new_client_app
end

When /^I create a client application$/ do
  new_client_app
end

When /^My client application authenticates$/ do
  #get user authorization and temp code
  @grant_code = authorize_client @application_key
  @grant_code.should_not be_nil
  @grant_code.should_not be_empty
end

Then /^My client has an access token$/ do
  access_token = exchange_code_for_token @application_key, @application_secret, @grant_code
  access_token.should_not be_nil
  access_token.should_not be_empty
end

Then /^I have a key and secret for the application$/ do
  find('li#application_key').text.should_not be_empty
  find('li#application_secret').text.should_not be_empty
end
