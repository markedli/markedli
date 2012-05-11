class BookmarksController < ApplicationController
  def index
  end

	def new
		@bookmark = Bookmark.new
	end

	def create
		@bookmark = Bookmark.create(params[:bookmark])
		@bookmark.timestamp = Time.now.to_i
		if @bookmark && @bookmark.save
      flash[:notice] = "Bookmark created successfully"
      redirect_to(@bookmark)
    else
      flash[:error] = "Error creating bookmark"
			flash[:notice] = @bookmark.title
      render :action => "new"
    end
	end

	def show
		@bookmark = Bookmark.find(params[:id])
	end

end
