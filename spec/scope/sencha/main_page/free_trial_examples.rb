require 'spec_helper'
require_relative '../../../../helpers/special_methods'
required_relative_all "/pages/sencha/*.rb"

examples_page = ExamplesPage.new
products_page = ProductsPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'View Start a Free Trial examples' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['examples_page'] do |url|
          page.visit url
        end

        step "User sees Ext JS Examples" do
          examples_page.should_see_ext_js_examples_name
          examples_page.click_ext_js_examples_free_trial

          sleep 5 # wait for window registration
          products_page.should_see_ext_js_header
          page.go_back
        end

        step "User sees Ext Angular Examples" do
          examples_page.should_see_ext_angular_examples_name
          examples_page.click_ext_angular_examples_free_trial

          sleep 2 # wait for window registration
          products_page.should_see_ext_angular_header
          page.go_back
        end

        step "User sees Ext Web Components Examples" do
          examples_page.should_see_ext_web_components_examples_name
          examples_page.click_ext_web_components_examples_free_trial

          sleep 2 # wait for window registration
          products_page.should_see_ext_web_components_header
          page.go_back
        end

        step "User sees Ext React Examples" do
          examples_page.should_see_ext_react_examples_name
          examples_page.click_ext_react_examples_free_trial

          sleep 2 # wait for window registration
          products_page.should_see_ext_react_header
          page.go_back
        end

        step "User sees GXT Examples" do
          examples_page.should_see_gxt_examples_name
          examples_page.click_gxt_examples_free_trial

          sleep 2 # wait for window registration
          products_page.should_see_gxt_header
          page.go_back
        end


        sleep 3
      end
    end

  end
end
