When /^I create a bookmark$/ do
  visit '/bookmarks/new'

  fill_in 'URL', :with => "http://www.example.com"
  fill_in 'Title', :with => "Fake title"

  click_button "Save"
end

Then /^I should see my new bookmark$/ do
	page.should have_content("Your bookmark URL is")
  find('#flash_notice').should have_content('Bookmark created successfully')
end

