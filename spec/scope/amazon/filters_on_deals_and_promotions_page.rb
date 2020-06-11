require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/amazon/*.rb"


header_navigation = HeaderNavigation.new
deals_page = DealsPage.new


describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by Deals and Promotions page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('amazon')['page'] do |url|
          page.visit url
        end

        step "User clicks on deals today button" do
          header_navigation.click_deals_today_btn
        end

        step "User clicks on fashion checkbox" do
          deals_page.click_fashion_checkbox
        end

        step "User clicks on beauty checkbox" do
          deals_page.click_beauty_checkbox
        end

        step "User clicks on See more Department" do
          deals_page.click_see_more
        end

        step "User clicks on See less Department" do
          deals_page.click_see_less
        end

        step "User clicks on clear availability" do
          deals_page.click_clear_availability
        end

        step "User clicks on clear department" do
          deals_page.click_clear_department
        end

        step "User clicks on price 50 - 100" do
          deals_page.click_price_50_100
        end

        step "User clicks on discount 10 off or more" do
          deals_page.click_discount_10_or_more
        end

        step "User clicks on three stars up" do
          deals_page.click_three_stars_up
        end
      end
    end
  end
end
