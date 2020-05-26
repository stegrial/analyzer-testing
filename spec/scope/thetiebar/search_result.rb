require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/thetiebar/*.rb"

header_page = TheTiebarHeader.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Search result product page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('thetiebar')['main_page'] do |url|
          page.visit url
        end

        step "User click the search button" do
          header_page.click_search_button
        end

        step "User fills search query field", "socks" do |search_query|
          header_page.fill_search_input search_query
        end

        step "User click the account button" do
          header_page.click_enter_search_result
        end

        sleep 3
      end
    end

  end
end
