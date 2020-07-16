require 'spec_helper'
require_relative '../../../../helpers/special_methods'
required_relative_all "/pages/sencha/*.rb"

examples_page = ExamplesPage.new
docs_page = DocsPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'View Docs page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['examples_page'] do |url|
          page.visit url
        end

        step "User clicks Docs link on header" do
          examples_page.click_docs_link
        end

        step "User clicks header list menu" do
          docs_page.click_header_list_menu
        end

        step "User sees menu version products" do
          docs_page.should_see_product_ext_js
          docs_page.should_see_product_ext_angular
          docs_page.should_see_product_ext_react
          docs_page.should_see_product_ext_web_component
        end

        step "User clicks Docs Help button" do
          docs_page.click_docs_help_btn
        end

        step "User sees Contents menu" do
          docs_page.should_see_contents_menu_header
          docs_page.should_see_terms_icons_labels_title
          docs_page.should_see_access_levels_title
          docs_page.should_see_members_types_title
          docs_page.should_see_members_syntax_title
          docs_page.should_see_members_flag_title
          docs_page.should_see_class_icons_title
          docs_page.should_see_member_icons_title
        end

        step "User clicks Close Docs Help button" do
          docs_page.click_close_docs_help_btn
        end

        step "User sess History Ext JS" do
          docs_page.should_see_header_ext_js
          docs_page.should_see_ext_js_getting_started
          docs_page.should_see_ext_js_documentation
        end

        step "User sess History Ext Angular" do
          docs_page.should_see_header_ext_angular
          docs_page.should_see_ext_angular_getting_started
          docs_page.should_see_ext_angular_documentation
        end


        sleep 3
      end
    end

  end
end
