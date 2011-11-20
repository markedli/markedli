class ClientApplicationsController < ApplicationController
  def new
    @client_application = ClientApplication.new
  end
  def create
    @client_application = ClientApplication.create(params[:client_application])
    redirect_to @client_application
  end
  def show
    @client_application = ClientApplication.find(params[:id])
  end
end
