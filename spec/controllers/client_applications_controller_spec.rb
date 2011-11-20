require 'spec_helper'

describe ClientApplicationsController do
  describe "#new" do
    it "should assign a new client application as @client_application" do
      get :new
      assigns(:client_application).should be_a_new(ClientApplication)
    end
  end
  describe "#create" do
    context "with valid params" do
      it "creates a new ClientApplication" do
        expect {
          post :create, :client_application => Factory.attributes_for(:client_application)
        }.to change(ClientApplication, :count).by(1)
      end
      it "assigns the created ClientApplication as @client_application" do
        post :create, :client_application => Factory.attributes_for(:client_application)
        assigns(:client_application).should be_a(ClientApplication)
        assigns(:client_application).should be_persisted
      end
      it "redirects to the newly created ClientApplication" do
        post :create, :client_application => Factory.attributes_for(:client_application)
        response.should redirect_to(ClientApplication.last)
      end
    end
  end
  describe "#show" do
    it "assigns the requested ClientApplication as @client_application" do
      client_application = ClientApplication.create! Factory.attributes_for(:client_application)
      get :show, :id => client_application.id
      assigns(:client_application).should eq(client_application)
    end
  end
end
