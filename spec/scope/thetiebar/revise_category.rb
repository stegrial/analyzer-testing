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

  feature 'Revese category' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('thetiebar')['main_page'] do |url|
          page.visit url
        end

        step "User clicks the shirts category" do
          header_page.click_shirts_category
        end

        step "User clicks on the neckties category" do
          header_page.click_neckties_category
        end

        step "User clicks on the bowties category" do
          header_page.click_bowties_category
        end

        step "User clicks the tiebars category" do
          header_page.click_tiebars_category
        end

        step "User clicks the accessories category" do
          header_page.click_accessories_category
        end

        step "User clicks the wedding category" do
          header_page.click_wedding_category
        end

        sleep 3
      end
    end

  end
end
