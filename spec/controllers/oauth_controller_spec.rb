require 'spec_helper'

describe OauthController do
  describe '#authorize' do
    context "without a logged in user" do
      it "redirects to login" do
        get :authorize
        response.should redirect_to new_user_session_path
      end
    end
    context "with a logged in user" do
      let(:user) { Factory(:user) }
      before(:each) { sign_in user }
      let(:client_application) { ClientApplication.create! Factory.attributes_for(:client_application) }
      let(:client_key) { client_application.key }
      let(:redirect_uri) { "http://client.app" }
      it "creates an AccessGrant for the application & logged in user" do
        expect {
          get :authorize, :client_id => client_key
        }.to change(AccessGrant, :count).by(1)
        assigns(:access_grant).client_application.should == client_application
        assigns(:access_grant).user.should == user
      end
      it "redirects the user back to the client" do
        get :authorize, :client_id => client_key, :redirect_uri => redirect_uri
        response.should be_redirect
        response.redirect_url.should be_include(redirect_uri)
      end
      it "returns an access grant code param" do
        get :authorize, :client_id => client_key, :redirect_uri => redirect_uri
        response.redirect_url.should be_include("code=#{AccessGrant.last.code}")
      end
    end
  end
  describe "#access_token" do
    let(:client_application) { ClientApplication.create! Factory.attributes_for(:client_application) }
    let(:client_key) { client_application.key }
    let(:client_secret) { client_application.secret }
    let(:access_grant) { AccessGrant.create! :client_application => client_application }
    let(:code) { access_grant.code }
    it "verifies the client application" do
      ClientApplication.should_receive(:authorize).with(client_key, client_secret)
      get :access_token, :client_id => client_key, :code => code, :client_secret => client_secret
    end
    it "returns an error if no client application matches" do
      get :access_token, :client_id => "somekey", :code => code, :client_secret => client_secret
      response.body.should eq({:error => "No client application found"}.to_json)
    end
    it "authorizes the access grant with the temporary code" do
      AccessGrant.should_receive(:authorize).with(client_application, code)
      get :access_token, :client_id => client_key, :code => code, :client_secret => client_secret
    end
    it "returns an error if no access grant matches" do
      get :access_token, :client_id => client_key, :code => "somecode", :client_secret => client_secret
      response.body.should eq({:error => "No grant found"}.to_json)
    end
    it "responds with an access token" do
      get :access_token, :client_id => client_key, :code => code, :client_secret => client_secret
      response.body.should eq({:access_token => access_grant.access_token}.to_json)
    end
  end
end
