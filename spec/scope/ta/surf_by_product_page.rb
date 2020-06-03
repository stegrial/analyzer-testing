require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/ta_pages/*.rb"

doc_page = DocPage.new
product_page = ProductPage.new
sign_up_page = SignUpPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)

  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by product page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the product page", settings('ta')['product_page'] do |url|
          page.visit url
        end

        step "User clicks get a trial button" do
          product_page.click_try_it_now_btn
        end

        step "User sees sign up text" do
          sign_up_page.should_see_sign_up_text
        end

        step "User goes to the product page", settings('ta')['product_page'] do |url|
          page.visit url
        end

        step "User clicks check out documentation 1 button" do
          product_page.click_check_out_docs_btn
          last_handle = page.driver.browser.window_handles.last
          page.driver.browser.switch_to.window(last_handle)
        end

        step "User sees install client text" do
          doc_page.should_see_install_client
          move_between_tabs
        end

        step "User clicks check out documentation 2 button" do
          product_page.click_check_out_docs_2_btn
          last_handle = page.driver.browser.window_handles.last
          page.driver.browser.switch_to.window(last_handle)
        end

        step "User sees install client text" do
          doc_page.should_see_install_client :il #step is duplicated below
          move_between_tabs
        end

        step "User clicks check out documentation 3 button" do
          product_page.click_check_out_docs_3_btn
          last_handle = page.driver.browser.window_handles.last
          page.driver.browser.switch_to.window(last_handle)
        end

        step "User sees install client text" do
          doc_page.should_see_install_client :il #step is duplicated below
          move_between_tabs
        end

        step "User clicks submit a feature request button" do
          product_page.click_submit_a_feature_request
        end

        step "User sees sign up text" do
          sign_up_page.should_see_sign_up_text :il #step is duplicated below
        end

        sleep 3
      end
    end

  end
end
