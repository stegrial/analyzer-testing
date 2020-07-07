require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/walmart/*.rb"

main_page = MainPageWalmart.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by weekly page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('walmart')['main_page'] do |url|
          page.visit url
        end

        step "User click to edit delivery zip code button" do
          main_page.click_edit_delivery_zipcode
        end

        step "User click to edit delivery zip code button" do
          main_page.should_see_enter_location_text
        end

        step "User fill zip code field", "10001" do |value|
          main_page.fill_set_zip_code value
        end

        step "User click Update location button" do
          main_page.click_update_location
        end

        step "User click feedback button" do
          main_page.click_feedback
        end

        step "User sees 'How was your experience' text" do
          main_page.should_see_your_experience_text
        end

        step "User click  Good star" do
          main_page.click_good_star
        end

        step "User set text in 'Add comment' field", "text" do |value|
          main_page.set_text_in_add_comment_field value
        end

        step "User click Submit button" do
          main_page.click_submit_btn
        end

        sleep 3
      end
    end

  end
end
