require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

press_page = PressPage.new
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

  feature 'Select Press details on home page' do

    # Initial locators with Recording
    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('annieselke')['page'] do |url|
          page.visit url
          banner_page.close_banner
        end

        step "User clicks 'Press'" do
          footer_page.click_companies "Press"
        end

        step "User clicks first catalog on the page" do
          banner_page.close_banner
          press_page.click_first_catalog
        end

        step "User clicks Choose Items below" do
          press_page.click_choose_items
        end

        step "User selects first element" do
          press_page.select_size
        end

        step "User fills quantity" do
          press_page.set_quantity '2'
          banner_page.close_banner
        end

        step "User adds item to cart" do
          press_page.add_to_card
        end

        sleep 3
      end
    end
  end
end
