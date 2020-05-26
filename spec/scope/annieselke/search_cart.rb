require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/annieselke/*.rb"

header_page = HeaderPage.new
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

  feature 'Search items on home page and check cart' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('annieselke')['page'] do |url|
          page.visit url
          banner_page.close_banner
          banner_page.close_cupon_banner
        end

        step "Search items", "GA" do |value|
          header_page.fill_search_input(value)
        end
        step "Check cart" do
          header_page.move_to_cart_link :il #step is duplicated below
        end

        step "Click View Cart" do
          header_page.click_view_cart_btn
        end

        step "Click to cart link" do
          header_page.click_cart_link
        end

        sleep 3
      end
    end

  end
end
