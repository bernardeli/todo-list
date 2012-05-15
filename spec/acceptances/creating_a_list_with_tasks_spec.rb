require 'spec_helper'

feature "Creating a new list with tasks" do
  let(:user) { FactoryGirl.create(:user, :email => 'user@email.com', :password => 'abc12345') }

  background do
    visit root_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => "abc12345"
    click_button "Sign in"
  end

  scenario "creates a new list" do
    click_link "Create a new list"
    fill_in "List name", :with => "Grocery store"
    fill_in "Task", :with => "Cucumber"
    click_button "Create"

    page.should have_content("List was successfully created")
    page.should have_content("Grocery store")
    page.should have_content("Cucumber")
  end
end
