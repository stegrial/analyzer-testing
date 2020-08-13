require 'spec_helper'
require_relative '../../../../helpers/special_methods'
required_relative_all "/pages/sencha/*.rb"

ext_js_page = ExtJSPage.new
multi_select_and_item_selector_ext_js_page = MultiSelectAndItemSelectorExtJSPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'View MultiSelect and ItemSelector Ext JS page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['ext_js_page'] do |url|
          page.visit url
        end

        step "User clicks MultiSelect and ItemSelector title" do
          ext_js_page.click_miscellaneous_header
          ext_js_page.click_multi_select_and_item_selector_header
        end

        step "User sees header MultiSelect & ItemSelector" do
          multi_select_and_item_selector_ext_js_page.should_see_header_multi_select_and_item_selector
        end


        sleep 3
      end
    end

  end
end
