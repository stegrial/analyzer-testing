require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/facebook/*.rb"

include ElementSearchValidation

header_nav = HeaderNaviPageFacebook.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by help center menu '  do

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

        step "User click Help Center button" do
          header_nav.click_help_center_btn
        end

        step "User sees Help With This Page text" do
          header_nav.should_see_help_with_this_page
        end

        step "User fill How Can I Help input", "test" do |value|
          header_nav.fill_how_can_i_help_input value
        end

        step "User click first help search result" do
          header_nav.click_help_search_result
        end

        step "User sees 'The Facebook for Android...' text" do
          header_nav.should_see_fb_android_text
        end

        step "User click Back link" do
          header_nav.click_back_button
        end

        step "User click 'Chat and Messages' link" do
          header_nav.click_chat_and_messages
        end

        step "User click 'See more help' link" do
          header_nav.click_see_more_help
        end

        step "User sees 'Help Center' title" do
          header_nav.should_see_help_center_text
        end
      end
    end
  end
end
