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

  feature 'Fill on free trial Ext JS' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['examples_page'] do |url|
          page.visit url
        end

        step "User clicks Ext JS Examples" do
          examples_page.click_ext_js_examples_free_trial
        end

        step "User sees window registration header" do
          sleep 5 # wait for window registration
          products_page.should_see_ext_js_full_trial_text
          products_page.should_see_ext_js_try_30_day_text
        end

        step "User fills the first name field", "Igor" do |first_name|
          products_page.fill_ext_js_first_name_field(first_name)
        end

        step "User fills the last name field", "Shapovalov" do |last_name|
          products_page.fill_ext_js_last_name_field(last_name)
        end

        step "User fills the email field", "email.com" do |email|
          products_page.fill_ext_js_email_field(email)
        end

        step "User fills the phone field", "380111111111" do |phone|
          products_page.fill_ext_js_phone_field(phone)
        end

        step "User selects country Ukraine" do
          products_page.click_ext_js_country
          products_page.click_ext_js_country_ukraine
        end

        step "User clicks Download with ZIP" do
          products_page.click_ext_js_download_zip
        end

        step "User clicks I agree to terms" do
          products_page.click_ext_js_i_agree_to_terms
          products_page.click_ext_js_i_have_read
          products_page.click_ext_js_i_agree_to_receive
        end

        step "User clicks Download Now" do
          products_page.click_ext_js_download_now
        end


        sleep 3
      end
    end

  end
end
