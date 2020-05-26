require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/annieselke/*.rb"

header_page = HeaderPage.new
product_page = ProductPage.new
banner_page = BannerPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Navigation and adding product to cart' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('annieselke')['page'] do |url|
          page.visit url
        end

        step "Close banners" do
          banner_page.close_banner
          banner_page.close_cupon_banner
        end

        step "Set mirrors in search field", "mirror\n" do |value|
          header_page.fill_search_input(value)
        end

        step "Click 'Tia Mirror' on product page" do
          product_page.click_tia_mirror_link
        end

        step "User clicks size dropdown arrow", "/D%C3%A9cor-%26-Pillows/Tia-Mirror/p/ASH8714-ACS" do |value|
          product_page.click_dropdown_arrow
          product_page.select_dropdown value
          banner_page.close_banner
        end

        step "User clicks gallery img to change view" do
          scroll_to_element 700
          product_page.click_to_change_gallery_img
        end

        step "User clicks on Social networks icons" do
          product_page.click_on_facebook_icon

          move_between_tabs
          product_page.click_on_twitter_icon

          move_between_tabs
          product_page.click_on_pinterest_icon

          move_between_tabs
          product_page.click_on_houzz_icon
          move_between_tabs
        end

        step "User clicks additional details" do
          product_page.click_on_additional_details
        end

        step "User fill quantity", "2" do |value|
          product_page.fill_qty(value)
        end

        step "User clicks Add to cart" do
          product_page.click_add_to_cart
        end

        sleep 3
      end
    end

  end
end
