
require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/flipkart/*.rb"


press_page = PressPageFlipkart.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by Press page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('flipkart')['press_page'] do |url|
          page.visit url
        end

        step "User sees NEWS h1 on page" do
          press_page.should_see_news_h1
        end

        step "User sees Features h2 on page" do
          press_page.should_see_featured_h2
        end

        step "User click on Shop With Upto link in left side column on page" do
          press_page.click_on_shop_with_upto
        end

        step "User sees Shop With Upto h1 on page" do
          press_page.should_see_shop_with_upto_h1
          page.go_back
        end

        step "User sees Studio34 Podcasts list on page" do
          press_page.should_see_podcasts_list
        end

        step "User click Older Post button" do
          press_page.click_on_older_post_btn
        end

        step "User click Newer Post button" do
          press_page.click_on_newer_post_btn
        end

        step "User sees Instagram Feed " do
          press_page.should_see_instagram_feed
        end

        step "User ckick Twitter Author in twitter block" do
          press_page.click_tweetauthor_in_frame
          move_between_tabs
        end

        step "User sees Explore Digital India with Flipkart Stories h1" do
          press_page.click_on_discover_btn
        end

        step "User sees Explore Digital India with Flipkart Stories h1" do
          press_page.should_see_explore_digital_h1
          page.go_back
        end

        step "User fill subscribe email", "test@email.com" do |value|
          press_page.fill_subscribe_email value
        end
      end
    end
  end
end

