require 'spec_helper'
require_relative '../../../../helpers/special_methods'
required_relative_all "/pages/sencha/*.rb"

ext_js_page = ExtJSPage.new
animated_data_view_ext_js_page = AnimatedDataViewExtJSPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'View Animated DataView Ext JS page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['ext_js_page'] do |url|
          page.visit url
        end

        step "User clicks Animated DataView title" do
          ext_js_page.click_data_view_header
          ext_js_page.click_animated_data_view_header
        end

        step "User sees header Animated DataView Examples" do
          animated_data_view_ext_js_page.should_see_header_animated_data_view
        end


        sleep 3
      end
    end

  end
end
