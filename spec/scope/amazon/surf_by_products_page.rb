require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/amazon/*.rb"

header_navigation = HeaderNavigation.new
plp = ProductListPage.new
sign_in_page = SignInPage.new


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

        step "User clicks on ", "harry potter" do |value|
          header_navigation.set_data_in_search(value)
        end

        step "User clicks on search button " do
          header_navigation.click_search_btn
        end

        step "User sees product from search result on page" do
          plp.should_see_product_from_search
        end

        step "User sees previous pagination on page" do
          plp.should_see_previous_pagination
        end

        step "User sees next pagination on page" do
          plp.should_see_next_pagination
        end

        step "User click 2 pagination on page" do
          plp.click_pagination_2
        end

        step "User sees brands in search" do
          plp.should_see_brands_in_search
        end

        step "User sees need help block" do
          plp.should_see_need_help_block
        end

        step "User click visit help section" do
          plp.click_visit_help_section
          page.go_back
        end

        step "User click contact us link" do
          plp.click_contact_us
        end

        step "User sees Sign-In h1" do
          sign_in_page.should_see_sign_in_h1
        end

        sleep 3
      end
    end

  end
end
