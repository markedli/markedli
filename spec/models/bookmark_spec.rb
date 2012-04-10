require 'spec_helper'

describe Bookmark do

	before do
		@bookmark = Bookmark.new(url: "www.example.com", title: "Example.com", user_id: 1)
	end
	
	subject { @bookmark }
	
	it { should respond_to(:url) }
	it { should respond_to(:title) }
	it { should respond_to(:user_id) }
	
	it { should be_valid }
	
	describe "when url is not present" do
		before { @bookmark.url = "" }
		it { should_not be_valid }
	end
	
	describe "when url is too short" do
		before { @bookmark.url = "a" }
		it { should_not be_valid }
	end
	
	describe "when title is not present" do
		before { @bookmark.title = "" }
		it { should_not be_valid }
	end

	describe "when title is too short" do
		before { @bookmark.url = "a" }
		it { should_not be_valid }
	end

	describe "when title is too long" do
		before { @bookmark.url = "a" * 256 }
		it { should_not be_valid }
	end

	describe "when description is too long" do
		before { @bookmark.description = "a" * 10001 }
		it { should_not be_valid }
	end

	describe "when user_id is not present" do
		before { @bookmark.user_id = nil }
		it { should_not be_valid }
	end

end
