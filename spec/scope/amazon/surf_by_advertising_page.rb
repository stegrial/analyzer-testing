require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/amazon/*.rb"


footer_nav = FooterNavigation.new
advertising_page = AdvertisingPage.new


describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by Amazon Advertising page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('amazon')['page'] do |url|
          page.visit url
        end

        step "User clicks on Amazon Advertising link" do
          footer_nav.click_amazon_advertising_link
        end

        step "User sees on advertising logo" do
          advertising_page.should_see_advertising_logo
          end

        step "User sees on amazon advertising h1" do
          advertising_page.should_see_amazon_advertising_h1
        end

        step "User sees main video on page" do
          advertising_page.should_see_main_video
        end

        step "User sees 'Get Started Now' on page" do
          advertising_page.should_see_get_started_now
        end

        step "User click 'Sponsored popup'" do
          advertising_page.click_on_sponsored_popup
        end

        step "User sees 'Sponsored product' H4" do
          advertising_page.should_see_sponsored_product_h4
        end

        step "User click 'Learn More' link" do
          advertising_page.click_on_learn_more
          page.go_back
        end

        step "User sees 'More Products' H2" do
          advertising_page.should_see_more_product_h2
        end

        step "User click 'Learn More Products' link" do
          advertising_page.click_on_learn_more_product
        end

        step "User sees 'Video Ads' h1" do
          advertising_page.should_see_video_ads_h1
          page.go_back
        end

        step "User sees 'More Resources'" do
          advertising_page.should_see_more_resources
        end

        step "User click 'FAQ' link" do
          advertising_page.click_on_faq_link
        end

        step "User sees 'FAQ' h1" do
          advertising_page.should_see_faq_h1
        end
      end
    end
  end
end
