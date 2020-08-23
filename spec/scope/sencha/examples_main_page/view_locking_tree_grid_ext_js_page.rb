require 'spec_helper'
require_relative '../../../../helpers/special_methods'
required_relative_all "/pages/sencha/*.rb"

ext_js_page = ExtJSPage.new
locking_tree_grid_ext_js_page = LockingTreeGridExtJSPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'View Locking TreeGrid Ext JS page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['ext_js_page'] do |url|
          page.visit url
        end

        step "User clicks Locking TreeGrid title" do
          ext_js_page.click_trees_header
          ext_js_page.click_locking_tree_grid_title
        end

        step "User sees header Locking TreeGrid" do
          locking_tree_grid_ext_js_page.should_see_header_locking_tree_grid
        end


        sleep 3
      end
    end

  end
end
