require 'spec_helper'
require_relative '../../../../helpers/special_methods'
required_relative_all "/pages/sencha/*.rb"

ext_js_page = ExtJSPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Select versions dropdown Ext JS page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['ext_js_page'] do |url|
          page.visit url
        end

        step "User clicks on dropdown version" do
          ext_js_page.click_dropdown_version
        end

        step "User selects on dropdown version 7.1.0" do
          ext_js_page.click_dropdown_7_1_0
        end

        step "User clicks on dropdown version" do
          sleep 1 # wait for il locator
          ext_js_page.click_dropdown_version :il # step is duplication below
        end

        step "User selects on dropdown version 7.0.0" do
          ext_js_page.click_dropdown_7_0_0
        end

        step "User clicks on dropdown version" do
          sleep 1 # wait for il locator
          ext_js_page.click_dropdown_version :il # step is duplication below
        end

        step "User selects on dropdown version 6.7.0" do
          ext_js_page.click_dropdown_6_7_0
        end

        step "User clicks on dropdown version" do
          sleep 1 # wait for il locator
          ext_js_page.click_dropdown_version :il # step is duplication below
        end

        step "User selects on dropdown version 6.6.0" do
          ext_js_page.click_dropdown_6_6_0
        end

        step "User clicks on dropdown version" do
          sleep 1 # wait for il locator
          ext_js_page.click_dropdown_version :il # step is duplication below
        end

        step "User selects on dropdown version 6.5.3" do
          ext_js_page.click_dropdown_6_5_3
        end


        sleep 3
      end
    end

  end
end
