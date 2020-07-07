require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative "../../../pages/semantic/main_page"

main_page = MainPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'View main page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('semantic')['main_page'] do |url|
          page.visit url
        end

        step "User click 'English' button" do
          main_page.click_language_btn
        end

        step "User clicks 'English language'" do
          main_page.click_english_lang_btn
        end

        step "User sees Three buttons" do
          main_page.should_see_one_button
          main_page.should_see_two_button
          main_page.should_see_three_button
        end

        step "User click 'Select Theme'" do
          main_page.click_select_theme
        end

        step "User click 'Theme Semantic'" do
          main_page.click_theme_semantic
          main_page.should_see_view_source_button
        end

        step "User sess 'Unbelievable Theming' buttons" do
          main_page.should_see_view_button
          main_page.should_see_add_to_cart_button
          main_page.should_see_save_for_later_button
          main_page.should_see_rate_button
        end

        step "User sess 'Unbelievable Theming' Three buttons" do
          main_page.should_see_one_div
          main_page.should_see_two_div
          main_page.should_see_three_div
        end

        step "User sess 'Divider' buttons" do
          main_page.should_see_divider_a_button
          main_page.should_see_divider_or_button
          main_page.should_see_divider_b_button
        end

        step "User click 'Select Country'" do
          main_page.click_select_country
        end

        step "User click 'United Arab Emirates'" do
          main_page.click_country_arab_emirates
        end

        step "User sess 'Filter Posts'" do
          main_page.should_see_filter_posts
        end

        step "User sess 'Card' header" do
          main_page.should_see_cart_header
        end


        sleep 3
      end
    end

  end
end
