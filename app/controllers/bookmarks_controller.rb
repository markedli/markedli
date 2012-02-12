class BookmarksController < ApplicationController
  def index
  end

	def new
		@bookmark = Bookmark.new
	end

	def create
		respond_to do |format|
			if @bookmark && @bookmark.save
				flash[:notice] = "Bookmark created successfully"
				format.html {redirect_to(@bookmark)}
			else
				flash[:error] = "Error creating bookmark"
				format.html {render :action => "new"}
			end
		end
	end

	def show
	end

end
