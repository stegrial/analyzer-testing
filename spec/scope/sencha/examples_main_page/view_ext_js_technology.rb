require 'spec_helper'
require_relative '../../../../helpers/special_methods'
required_relative_all "/pages/sencha/*.rb"

examples_page = ExamplesPage.new
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

  feature 'View Ext JS technology' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['examples_page'] do |url|
          page.visit url
        end

        step "User clicks Ext JS examples name" do
          examples_page.click_ext_js_examples_name
        end

        step "User sees Ext JS header" do
          ext_js_page.should_see_hero_header
          ext_js_page.should_see_hero_text
        end


        sleep 3
      end
    end

  end
end
