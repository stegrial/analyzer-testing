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

  feature 'Start a free trial Ext JS' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['examples_page'] do |url|
          page.visit url
        end

        step "User clicks Ext JS Examples" do
          examples_page.click_ext_js_examples_free_trial
        end

        step "User sees Try Sencha header" do
          products_page.should_see_ext_js_header
          products_page.should_see_ext_js_full_trial_text
          products_page.should_see_ext_js_try_30_day_text
        end


        sleep 3
      end
    end

  end
end
