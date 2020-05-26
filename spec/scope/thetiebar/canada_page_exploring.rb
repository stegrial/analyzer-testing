require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/thetiebar/*.rb"

canada_page = TheTiebarCanada.new
pdp = TheTiebarProductPage.new
footer_page = TheTiebarFooterPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Canada Page exploring' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('thetiebar')['canada_page'] do |url|
          page.visit url
        end

        step "User clicks on wedding shop link and redirected on wedding ties page" do
          canada_page.click_wedding_shop
          pdp.should_see_wedding_ties_h1
        end

        step "User clicks on the Canada link in footer and redirected on Canada ties page" do
          footer_page.click_canada
          canada_page.should_see_canada_h1
        end

        step "User clicks on shirts shop link and redirected on shirts page" do
          canada_page.click_shirts_shop
          pdp.should_see_shirts_h1
        end

        sleep 3
      end
    end

  end
end
