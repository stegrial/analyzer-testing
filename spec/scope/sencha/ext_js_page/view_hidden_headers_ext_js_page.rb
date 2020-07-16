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

  feature 'View hidden header Ext JS page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['ext_js_page'] do |url|
          page.visit url
        end

        step "User click 'Grids' header" do
          ext_js_page.click_grids_header
        end

        step "User sees 'Grids' titles" do
          ext_js_page.should_see_grid_data_binding_title
          ext_js_page.should_see_grid_with_summary_title
          ext_js_page.should_see_grid_with_buffered_store_title
          ext_js_page.should_see_grid_with_live_search_capability_title
          ext_js_page.should_see_remote_summary_title
          ext_js_page.should_see_restful_store_title
          ext_js_page.should_see_grid_with_writable_store_title
          ext_js_page.should_see_grid_with_json_writable_store_title
          ext_js_page.should_see_buffered_scrolling_title
          ext_js_page.should_see_grid_from_markup_title
          ext_js_page.should_see_grouping_summary_grid_title
          ext_js_page.should_see_grid_with_filtered_title
          ext_js_page.should_see_grouped_header_title
        end

        step "User click 'Trees' header" do
          ext_js_page.click_trees_header
        end

        step "User sees 'Trees' titles" do
          ext_js_page.should_see_licking_treeGrid_title
          ext_js_page.should_see_custom_drop_logic_title
          ext_js_page.should_see_buffer_rendered_tree_title
          ext_js_page.should_see_locking_buffer_rendered_tree_title
        end


        sleep 3
      end
    end

  end
end
