require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/flipkart/*.rb"


header_nav = HeaderNavigationFlipkart.new
travel_page = TravelPageFlipkart.new
offer_page = OfferPageFlipkart.new
cart_page = CartPageFlipkart.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by header navigation' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('flipkart')['main_page'] do |url|
          page.visit url
        end

        step "Need to press escape" do
          header_nav.escape
        end

        step "User hover to Electronics" do
          header_nav.hover_electronics
        end

        step "User hover to TVs & Appleances" do
          header_nav.hover_tv_appliances
        end

        step "User hover to Sports, Books & More" do
          header_nav.hover_sports_books_more
        end

        step "User click on Flight link" do
          header_nav.click_flights_link
        end

        step "User sees Travel page" do
          travel_page.should_see_travel_page
          page.go_back
        end

        step "USer click on Offer Zone link" do
          header_nav.click_offer_zone_link
        end

        step "User sees Fashion Top Deals on page" do
          sleep 3 # wait for page load
          offer_page.should_see_fashion_top_deals
        end

        step "User sees Mobile New Launches page" do
          offer_page.should_see_mobile_new_launches
        end

        step "User clicks Cart icon" do
          header_nav.click_cart_icon
        end

        step "User sees My Cart page" do
          cart_page.should_see_my_cart
        end

        step "User click Logo" do
          header_nav.click_logo
        end

        step "User hover More dropdown" do
          header_nav.hover_more_dropdown
        end

        step "User hover More dropdown", "dress" do |value|
          header_nav.fill_search_input value
        end

        step "User hover Search button " do
          header_nav.click_search_btn
        end

        step "User hover Login button" do
          header_nav.click_login_btn
        end

        step "User sees Login text in modal" do
          header_nav.should_see_login_text_in_modal
        end

        sleep 3
      end
    end

  end
end
