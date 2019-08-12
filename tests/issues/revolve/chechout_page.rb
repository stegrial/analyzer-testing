require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/revolve'

it = Revolve.new


describe 'Preconditions' do

  before(:all) do
    $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'Select categories and product' do

    scenario 'Recording IL', il_run: true do

      step "User goes to the page" do
        visit 'https://revolve-pwa.moovweb.cloud/mobile/s?s=c&c=Jewelry%20%26%20Accessories&sc=&d=Womens&fw=false'
      end

      step "User clicks on jewelry product img" do
        it.click_jewelry_product_img :il
      end

      step "User clicks on buy button" do
        it.click_add_to_bag :il
      end

      step "User clicks cart page" do
        it.click_view_bag :il
      end

      step "User clicks on checkout page" do
        sleep 5
        it.click_proceed_to_checkout1
        it.click_proceed_to_checkout2
      end

      step "User set name ", "juli test" do |name|
        it.set_name( name)
      end

      step "User set address ", "Home st." do |address|
        it.set_address( address)
      end

      step "User set more address", "apt.12" do |address2|
        it.set_deep_address(address2)
      end

    sleep  5

    end
  end
end