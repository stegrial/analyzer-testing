require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

banner_page = BannerPage.new
footer_page = FooterPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Subscribe to news via email' do

    # Initial locators with Recording
    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('annieselke')['page'] do |url|
          page.visit url
        end

        step "Close banners" do
          banner_page.close_banner
          banner_page.close_cupon_banner
        end

        step "User fills email", settings('annieselke')['email'] do |email|
          footer_page.fill_email_subscription_name(email)
        end

        step "User clicks Submit button" do
          footer_page.click_email_subscription_btn
        end
      end
    end
  end
end
