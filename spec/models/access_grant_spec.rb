require 'spec_helper'

describe AccessGrant do
  it { should belong_to :client_application }
  it { should belong_to :user }
  it "should generate tokens on creation" do
    access_grant = AccessGrant.create! Factory.attributes_for(:access_grant)
    access_grant.code.should_not be_nil
    access_grant.access_token.should_not be_nil
  end
  describe "#authorize" do
    it "should find an access grant with an application and temp code" do
    access_grant = Factory(:access_grant)
    client_application = access_grant.client_application
    code = access_grant.code
    AccessGrant.authorize(client_application, code).should == access_grant
    end
  end
end
