require 'spec_helper'
require_relative '../../../../helpers/special_methods'
required_relative_all "/pages/sencha/*.rb"

ext_js_page = ExtJSPage.new
grid_with_buffered_store_ext_js_page = GridWithBufferedStoreExtJSPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'View Grid with Buffered Store Ext JS page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['ext_js_page'] do |url|
          page.visit url
        end

        step "User clicks on dropdown version" do
          ext_js_page.click_dropdown_version
        end

        step "User selects on dropdown version 6.6.0" do
          ext_js_page.click_dropdown_6_6_0
        end

        step "User clicks Grid with Buffered Store title" do
          ext_js_page.click_grids_header
          ext_js_page.click_grid_with_buffered_store_title
        end

        step "User sees header Grid with Buffered Store" do
          grid_with_buffered_store_ext_js_page.should_see_header_grid_with_buffered_store
        end


        sleep 3
      end
    end

  end
end
