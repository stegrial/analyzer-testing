require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/amazon/*.rb"


header_navigation = HeaderNavigation.new
covid_page = CovidPage.new
help_page = HelpPage.new
deals_page = DealsPage.new
gift_card_page = GiftCardPage.new
register_page = RegisterPage.new
selling_page = SellingPage.new


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

        step "User goes to the page", settings('amazon')['page'] do |url|
          page.visit url
        end

        step "User clicks on deals today button" do
          header_navigation.click_deals_today_btn
        end

        step "User sees deals and promotions page" do
          deals_page.should_see_deals_page
        end

        step "User clicks on customer service button" do
          header_navigation.click_customer_service_btn
        end

        step "User sees help page" do
          help_page.should_see_help_page
        end

        step "User clicks on gift cards button" do
          header_navigation.click_gift_cards_btn
        end

        step "User sees gift cards page" do
          gift_card_page.should_see_gift_cards_page
        end

        step "User clicks on registry button" do
          header_navigation.click_registry_btn
        end

        step "User sees register page" do
          register_page.should_see_register_page
        end

        step "User clicks on sell button" do
          header_navigation.click_sell_btn
        end

        step "User sees selling page" do
          selling_page.should_see_selling_page
        end

        step "User click and check COVID 19 block" do
          covid_page.click_and_check_covid_19
        end
      end
    end
  end
end
