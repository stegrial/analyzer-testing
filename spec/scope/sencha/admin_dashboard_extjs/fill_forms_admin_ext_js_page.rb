require 'spec_helper'
require_relative '../../../../helpers/special_methods'
required_relative_all "/pages/sencha/*.rb"

admin_dashboard_ext_js_page = AdminDashboardExtJSPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Fill second Forms on Admin Dashboard Ext JS page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['admin_dashboard_ext_js_page'] do |url|
          page.visit url
        end

        step "User clicks Forms menu" do
          admin_dashboard_ext_js_page.click_forms_menu
        end

        step "User fill Account panel on Forms", "IgorIgor", "me@somewhere.com",
             "Test1111", "Test1111" do |username, email, password, re_password|
          admin_dashboard_ext_js_page.fill_forms_username_field(username)
          admin_dashboard_ext_js_page.fill_forms_email_field(email)
          admin_dashboard_ext_js_page.fill_forms_password_field(password)
          admin_dashboard_ext_js_page.fill_forms_re_password_field(re_password)
          admin_dashboard_ext_js_page.click_next_btn :il # step is duplicated below
        end

        step "User fill Profile panel on Forms", "Igor", "Shapovalov", "CompanyName" do |first_name, last_name, company|
          admin_dashboard_ext_js_page.fill_forms_first_name_field(first_name)
          admin_dashboard_ext_js_page.fill_forms_last_name_field(last_name)
          admin_dashboard_ext_js_page.fill_forms_company_name_field(company)
          admin_dashboard_ext_js_page.click_member_free
          admin_dashboard_ext_js_page.click_next_btn :il # step is duplicated below
        end

        step "User fill Address panel on Forms", "380111111111", "Ukraine",
             "Odessa", "000000" do |phone_number, address, city, zip_code|
          admin_dashboard_ext_js_page.fill_forms_phone_number_field(phone_number)
          admin_dashboard_ext_js_page.fill_forms_address_field(address)
          admin_dashboard_ext_js_page.fill_forms_city_field(city)
          admin_dashboard_ext_js_page.fill_forms_zip_field(zip_code)
          admin_dashboard_ext_js_page.click_next_btn
        end

        step "User fill Finish panel on Forms" do
          admin_dashboard_ext_js_page.should_see_forms_thank_you
        end


        sleep 3
      end
    end

  end
end
