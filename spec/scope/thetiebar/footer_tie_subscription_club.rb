require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/thetiebar/*.rb"

subscription_page = TheTiebarSubscriptionPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Footer: CUSTOM TIES AND ACCESSORIES' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('thetiebar')['subscription_page'] do |url|
          page.visit url
        end

        step "User  select skinny ties 2.5'' radio button" do
          subscription_page.click_skinny_ties_25
        end

        step "User add button" do
          subscription_page.click_add_1
        end

        step "User click free place to close cart modal" do
          sleep 2 # wait for page load
          subscription_page.click_free_place :il # step is duplicated below
        end

        step "User  select neck ties 3.25'' radio button" do
          subscription_page.click_neck_ties_325
        end

        step "User add button" do
          subscription_page.click_add_2
        end

        step "User click free place to close cart modal" do
          sleep 2 # wait for page load
          subscription_page.click_free_place :il # step is duplicated below
        end

        step "User  select bow ties 12 radio button" do
          subscription_page.click_bow_ties_12
        end

        step "User add button" do
          subscription_page.click_add_3
        end

        step "User click free place to close cart modal" do
          sleep 2 # wait for page load
          subscription_page.click_free_place :il # step is duplicated below
        end

        step "User  select pairs socks 12 radio button" do
          subscription_page.click_pairs_socks_12
        end

        step "User add button" do
          subscription_page.click_add_4
        end

        step "User click free place to close cart modal" do
          subscription_page.click_free_place
        end

        sleep 3
      end
    end

  end
end
