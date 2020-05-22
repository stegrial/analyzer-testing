require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/thetiebar/*.rb"

footer_page = TheTiebarFooterPage.new
promo_page = TheTiebarPromoPage.new

describe 'Preconditions' do


  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Promotions page exploring' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('thetiebar')['main_page'] do |url|
          page.visit url
        end

        step "User clicks on the Promotions link" do
          footer_page.click_promotions
          footer_page.should_see_promotions_h1
        end

        step "User clicks new arrivals button" do
          promo_page.click_new_arrivals_btn
        end

        step "User sees Whats New page" do
          promo_page.should_see_whats_new_h1
        end

        sleep 3
      end
    end

  end
end
