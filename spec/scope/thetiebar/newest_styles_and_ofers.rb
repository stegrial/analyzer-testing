require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/thetiebar/*.rb"

main_page = TheTiebarMainPage.new
header_page = TheTiebarHeader.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Newest styles and offers' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('thetiebar')['main_page'] do |url|
          page.visit url
        end

        step "User clicks terms to use link" do
          main_page.click_terms_to_use
        end

        step "User clicks for redirecting on main pag" do
          header_page.click_logo :il # step is duplicated below
        end

        step "User clicks terms to use link" do
          main_page.click_privacy_police
        end

        step "User clicks for redirecting on main page" do
          header_page.click_logo
        end

        step "User fills search query field", "testtest@test.com" do |email|
          main_page.fill_singup_field email
        end

        step "User click join button" do
          main_page.click_join_btn
        end

        step "User check congrats text" do
          main_page.check_congrats_text
        end

        sleep 3
      end
    end

  end
end
