module CapybaraApp
  def app
    Capybara.app
  end
  def session
    puts page.driver.response.methods
    page.driver.response['rack.session']
  end
end
module ApiHelpers
  def get_param_from_response response, param
    Rack::Utils.parse_nested_query(response["Location"])[param]
  end
  def new_client_app 
    attributes = Factory.attributes_for(:client_application)
    
    visit '/client_applications/new'
    fill_in 'Name', :with => attributes[:name]
    fill_in 'Description', :with => attributes[:description]
    click_button 'Create'

    page.should have_content attributes[:name]
    return find('#application_key').text, find('#application_secret').text
  end
  def authorize_client key
    page.driver.get "/oauth/authorize?response_type=code&client_id=#{key}&state=test"
    page.driver.response.should be_redirect
    get_param_from_response page.driver.response, "code"
  end
  def exchange_code_for_token key, secret, code
    get "/oauth/access_token?client_id=#{key}&client_secret=#{secret}&code=#{code}"
    last_response.should be_ok
    last_response.body["access_token"]
  end
  def new_client_token
    key, secret = new_client_app
    code = authorize_client key
    exchange_code_for_token key, secret, code
  end
end
World(ApiHelpers)
World(CapybaraApp)
World(Rack::Test::Methods)
