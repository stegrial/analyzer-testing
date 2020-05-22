require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/thetiebar/*.rb"

about_us_page = TheTiebarAboutUs.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'About Us page exploring' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('thetiebar')['about_us_page'] do |url|
          page.visit url
        end

        step "User click the close cookies div" do
          about_us_page.click_close_coolies_div
        end

        step "User click the next slider button" do
          about_us_page.click_next_slider
        end

        step "User clicks on previous slider button" do
          about_us_page.click_previous_slider
        end

        step "User click next history button" do
          about_us_page.click_next_history_slider
        end

        step "User clicks on previous history button" do
          about_us_page.click_previous_history_slider
        end

        step "User clicks find store  button" do
          about_us_page.click_find_store_btn
        end

        step "User check ABOUT OUR TIE BAR STORES" do
          about_us_page.should_see_about_our_stores_h1
        end

        sleep 3
      end
    end

  end
end
