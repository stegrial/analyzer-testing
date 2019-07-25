require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/venus'

it = Venus.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'Size filter applying' do

    # Initial locators with Recording

    scenario 'Recording IL', il_run: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Clothing category" do
        it.click_clothing_category
      end

      step "User opens dropdown in the Clothing category" do
        it.open_category_dropdown
      end

      step "User chooses the Tops subcategory in the dropdown" do
        it.choose_tops_subcategory
      end

      step "User opens the Size filter" do
        it.open_size_filter
      end

      step "User chooses size in the list", 'S (4-6)' do |size|
        it.choose_size size
      end

      step "User clicks on the View Results button" do
        it.click_view_results_btn
      end

      sleep 3
    end


  end
end
