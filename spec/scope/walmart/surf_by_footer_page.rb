require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/walmart/*.rb"

footer_page = FooterPageWalmart.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by footer page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('walmart')['main_page'] do |url|
          page.visit url
        end

        step "User click 'Sign up' button" do
          footer_page.click_newsletter_signup
        end

        step "User sees input error" do
          footer_page.should_see_input_error
        end

        step "User fill email input", "test@gmail.com" do |value|
          footer_page.fill_email_input value
        end

        step "User sees Facebook icon" do
          footer_page.should_see_facebook_icon
        end

        step "User sees Twitter icon" do
          footer_page.should_see_twitter_icon
        end

        step "User sees Pinterest icon" do
          footer_page.should_see_pinterest_icon
        end

        step "User sees Instagram icon" do
          footer_page.should_see_instagram_icon
        end

        step "User sees Mobile Apps icon" do
          footer_page.should_see_mobile_apps
        end

        step "User click Money Center link" do
          footer_page.click_money_center
          page.go_back
        end

        step "User click Digital Museum link" do
          footer_page.click_digital_museum
          page.go_back
        end

        step "User click Our Ads link" do
          footer_page.click_our_ads
          page.go_back
        end

        step "User click Returns link" do
          footer_page.click_returns
          page.go_back
        end

        step "User click Nintendo Switch" do
          footer_page.click_nintendo_switch
          page.go_back
        end

        step "User sees Copyright text" do
          footer_page.should_see_copyright_text
        end

        step "User sees Reference Id" do
          footer_page.should_see_reference_id
        end

        sleep 3
      end
    end

  end
end
