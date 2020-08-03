require 'spec_helper'
require_relative '../../../../helpers/special_methods'
required_relative_all "/pages/sencha/*.rb"

examples_page = ExamplesPage.new
support_page = SupportPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'View Support page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['examples_page'] do |url|
          page.visit url
        end

        step "User clicks Support link on header" do
          examples_page.click_support_link
        end

        step "User sees Products menu on header" do
          sleep 10 # wait for img load
          support_page.hover_header_products_menu
          support_page.hover_dev_tools_menu

          support_page.should_see_test_automation_title
          support_page.should_see_drag_drop_ide_title
          support_page.should_see_command_line_tool_title
          support_page.should_see_debugging_tool_title
        end

        step "User sees Free Trial and Buy Now buttons on header" do
          support_page.should_see_free_trial_btn
          support_page.should_see_buy_now_btn
        end

        step "User fill Support Subscribers", "johndoe@example.com", "Test1111" do |email, password|
          support_page.fill_email_field(email)
          support_page.fill_password_field(password)
          support_page.click_sign_in_btn
          page.go_back
        end

        step "User sees links on Support Subscribers" do
          support_page.should_see_need_help_link
          support_page.should_see_how_to_use_support_link
          support_page.should_see_faq_link
        end


        sleep 3
      end
    end

  end
end
