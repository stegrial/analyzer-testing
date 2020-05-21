require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/thetiebar/*.rb"

product_page = TheTiebarProductPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Filtering product page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('thetiebar')['pants_page'] do |url|
          page.visit url
        end

        step "User clicks to select blue color filter" do
          product_page.click_to_select_color_blue
        end

        step "User clicks to select black color filter" do
          product_page.click_to_select_color_black
        end

        step "User click to select slim fit" do
          product_page.click_slim_fit
        end

        step "User click to select wool material" do
          product_page.click_wool_material
        end

        step "User click to select 28 waist" do
          product_page.click_28_waist
        end

        sleep 3
      end
    end

  end
end
