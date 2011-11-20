require 'spec_helper'

describe ClientApplication do
  it { should accept_values_for(:name, "My Application", "my_application", "my") }
  it { should_not accept_values_for(:name, nil, "", "m") }
  it { should accept_values_for(:description, "Description", "", "A longer description") }
  it "generates a client key and secret on creation" do
    client_application = Factory(:client_application)
    client_application.key.should_not be_nil
    client_application.secret.should_not be_nil
  end
  it "should not accept mass assigned key or secret" do
    client_application = Factory(:client_application, :key => "somekey", :secret => "somesecret")
    client_application.key.should_not == "somekey"
    client_application.secret.should_not == "somesecret"
  end
  describe "#with_id" do
    it "should search for ClientApplications by key" do
      client_application = Factory(:client_application)
      ClientApplication.with_id(client_application.key).should == client_application
    end
  end
  describe "#authorize" do
    it "should search for ClientApplications by key and secret" do
      client_application = Factory(:client_application)
      ClientApplication.authorize(client_application.key, client_application.secret).should == client_application
    end
  end
end
