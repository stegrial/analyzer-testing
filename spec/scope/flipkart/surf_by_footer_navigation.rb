require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/flipkart/*.rb"


header_nav = HeaderNavigationFlipkart.new
footer_page = FooterNavigationFlipkart.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by footer navigation' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('flipkart')['main_page'] do |url|
          page.visit url
        end

        step "Need to press escape" do
          header_nav.escape
        end

        step "User sees About in footer" do
          footer_page.should_see_about
        end

        step "User sees Help in footer" do
          footer_page.should_see_help
        end

        step "User sees Policy in footer" do
          footer_page.should_see_policy
        end

        step "User sees Social in footer" do
          footer_page.should_see_social
        end

        step "User sees Contact Us in About column in footer" do
          footer_page.should_see_contact_us_link
        end

        step "User sees About Us in  About column in footer" do
          footer_page.should_see_about_us_link
        end

        step "User sees Careers in About column in footer" do
          footer_page.should_see_careers_link
        end

        step "User sees Flipkart Stories in About column in footer" do
          footer_page.should_see_flipkart_stories_link
        end

        step "User sees Press in About column in footer" do
          footer_page.should_see_press_link
        end

        step "User sees Advertise in footer" do
          footer_page.should_see_advertise_link
        end

        step "User sees Gift Cards in footer" do
          footer_page.should_see_gift_cards_link
        end

        step "User sees Help Center  in footer" do
          footer_page.should_see_help_center_link
        end

        sleep 3
      end
    end

  end
end
