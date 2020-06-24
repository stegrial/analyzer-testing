require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/flipkart/*.rb"


navi_on_stories_page = NaviOnStoriesPageFlipkart.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by navigation on stories page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('flipkart')['stories_page'] do |url|
          page.visit url
        end

        step "User click  to close modal" do
          navi_on_stories_page.close_modal
        end

        step "User click on Top Stories in top navigation row" do
          navi_on_stories_page.click_on_top_stories
        end

        step "User click on Top Stories H1" do
          navi_on_stories_page.should_see_top_stories_h1
        end

        step "User click on Shopping Guides link" do
          navi_on_stories_page.hover_shopping_guides_link
        end

        step "User click on Homes link" do
          navi_on_stories_page.hover_homes_link
        end

        step "User click on SIgn Up button" do
          navi_on_stories_page.click_on_signup_btn
        end

        step "User click on Subscribe for Updates" do
          navi_on_stories_page.should_see_subscribe_for_updates
        end

        step "User click on Search button" do
          navi_on_stories_page.click_on_search_btn
        end

        step "User fill on Search input", "faq" do |value|
          navi_on_stories_page.click_on_search_input value
        end

        step "User click on faq Search result" do
          navi_on_stories_page.click_on_faq_search_result
        end

        sleep 3
      end
    end

  end
end

