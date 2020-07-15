require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/facebook/*.rb"

include ElementSearchValidation

header_nav = HeaderNaviPageFacebook.new
profile_page = ProfilePageFacebook.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Creating new post and add a first comment and deleting post after'  do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('facebook')['main_page'] do |url|
          page.visit url
        end

        step "User set login in login field", settings('facebook')['login'] do |value|
          header_nav.set_email value
        end

        step "User set password in password field", settings('facebook')['pass'] do |value|
          header_nav.set_pass value
        end

        step "User  clicks on the login button for entering into account" do
          header_nav.click_login_btn
        end

        step "Need to press escape" do
          header_nav.escape
        end

        step "User  click  profile button" do
          header_nav.click_profile_btn
        end

        step "User  click to create new post button" do
          profile_page.click_new_post_btn
        end

        step "User  fill  text in field", "new post for test" do  |value|
         profile_page.fill_text value
        end

        step "User  click  profile button" do
          profile_page.click_post_btn
        end

        step "User  sees  new post is created" do
          profile_page.should_see_new_post_created
        end

        step "User  fill comment field for created post", "new comment for created post\n"  do |value|
          profile_page.fill_comment_field value
        end

        step "User  click to open story option" do
          profile_page.click_to_open_story_option
        end

        step "User  click to open story option" do
          profile_page.click_to_delete_post
        end

        step "User  click to open story option" do
          profile_page.click_to_accept_delete_post
        end
      end
    end
  end
end
