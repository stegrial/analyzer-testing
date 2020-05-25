require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/annieselke/*.rb"

banner_page = BannerPage.new
footer_page = FooterPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Navigation to social networks' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('annieselke')['page'] do |url|
          page.visit url
        end

        step "Close banners" do
          banner_page.close_banner
          banner_page.close_cupon_banner
        end

        step "User clicks on Fresh American Style blog" do
          footer_page.click_blog_link
          sleep 5 # wait until page and tree is load
        end

        step "User clicks on Social networks icons" do
          banner_page.close_cupon_banner
          footer_page.click_on_facebook_icon

          move_between_tabs
          banner_page.close_cupon_banner
          footer_page.click_on_twitter_icon

          move_between_tabs
          banner_page.close_cupon_banner
          footer_page.click_on_pinterest_icon

          move_between_tabs
          banner_page.close_cupon_banner
          footer_page.click_on_youtube_icon

          move_between_tabs
          banner_page.close_cupon_banner
          footer_page.click_on_instagram_icon
        end

        sleep 3
      end
    end

  end
end
