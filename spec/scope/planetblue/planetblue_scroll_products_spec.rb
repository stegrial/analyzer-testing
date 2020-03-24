require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/planetblue/*.rb"

include ElementSearchValidation

planetblue = PlanetBlue.new
designers = Designers.new
menu = Menu.new
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end


  feature 'Planet Blue - Scroll Products' do

    scenario 'Recording Locators', record: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks Navigation Bar Link", 'New' do |value|
        planetblue.click_navbar_link value
      end

      step "User checks page Header", "What's New" do |title|
        planetblue.find_page_header title
      end

      step "User checks Collection Items and scroll down", 'NIGHT AFTER NIGHT DENIM | New', 'night-after-night-denim?' do |name, link|
        planetblue.find_collection_item name, link
        page.execute_script "window.scrollBy(0,1000)"
      end

      step "User checks Collection Items", 'HARVEY CROP DENIM JACKET | New', 'harvey-crop-denim-jacket' do |name, link|
        planetblue.find_collection_item name, link
      end

      step "User clicks 'Back to top' button" do
        planetblue.click_back_to_top_button
      end

      step "User scroll down to the bottom of the page" do
        page.execute_script "window.scrollBy(0,5000)"
      end

      step "User scroll down to the bottom of the page" do
        page.execute_script "window.scrollBy(0,5000)"
        sleep 1
        page.execute_script "window.scrollBy(0,5000)"
        sleep 1
        page.execute_script "window.scrollBy(0,5000)"
        sleep 1
        page.execute_script "window.scrollBy(0,5000)"
      end

      step "User click 'Load More' button" do
        planetblue.click_load_more_button
      end

      step "User checks social links on the bottom of the page",%w(Facebook Instagram Twitter YouTube Pinterest) do |links|
        links.each { |link|
          planetblue.find_social_link link
        }
      end

    end

  end
end