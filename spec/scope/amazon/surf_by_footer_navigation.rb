require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/amazon/*.rb"

footer_nav = FooterNavigation.new


describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by footer navigation' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('amazon')['page'] do |url|
          page.visit url
        end

        step "User sees back to top button" do
          footer_nav.should_see_back_to_top_btn
        end

        step "User sees 'Get To Know Us'" do
          footer_nav.should_see_get_to_know_us
        end

        step "User sees 'Make Money with Us'" do
          footer_nav.should_see_make_money_with_us
        end

        step "User sees 'Amazon payment'" do
          footer_nav.should_see_amazon_payment
        end

        step "User sees 'Let Us Help You'" do
          footer_nav.should_see_let_us_help_you
        end

        step "User click Careers link" do
          footer_nav.click_careers_link
          page.go_back
        end

        step "User click Sell on Amazon Business link" do
          footer_nav.click_sell_on_amazon_business
          page.go_back
        end

        step "User click Shop With Points" do
          footer_nav.click_shop_with_points
          page.go_back
        end

        step "User click Your Account" do
          footer_nav.click_your_account
          page.go_back
        end

        step "User click footer logo" do
          footer_nav.should_see_footer_logo
        end

        step "User hover language button" do
          footer_nav.click_language_btn
        end

        step "User click learn more link" do
          footer_nav.click_learn_more_link
          page.go_back
        end

        step "User click region button" do
          footer_nav.click_region_btn
        end

        step "User sees website region" do
          footer_nav.should_see_website_region
        end

        step "User click cancel button link" do
          footer_nav.click_cancel_region_btn
        end

        sleep 3
      end
    end

  end
end
