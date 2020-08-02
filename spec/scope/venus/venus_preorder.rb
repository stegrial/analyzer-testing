require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/venus/*.rb"

pre_order_page = PreOrderPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Venus - Navigate to Pre-Order Page' do

    $run_count.times do
      scenario 'Recording Locators', "#{$tag}": true do

        step "User goes to the page", settings('venus')['preorder_page'] do |url|
          page.visit url
        end

        step "User checks a Banner" do
          pre_order_page.should_see_banner
        end

        step "User checks Langing Image" do
          pre_order_page.should_see_landing_image
        end

        step "User clicks sub categories dropdown" do
          pre_order_page.click_sub_categories_dropdown
        end

      end
    end
  end
end