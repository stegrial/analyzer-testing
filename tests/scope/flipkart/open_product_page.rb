require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/flipkart_desctop'

it = Flipkart.new
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'TA-787(was not actual at the time of ticket creation) flipkart - open PDP' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do

      step "User goes to the page", settings('flipkart')['page'] do |url|
        page.visit url
      end

      step "Need to press escape " do
        it.escape
      end

      step "User clicks women link" do
        it.click_women_link
      end

      step "User clicks on dresses link" do
        it.click_dresses_link
      end

      # 
      step "User clicks ]second dress link" do
        it.click_second_dress_link
      end
    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('flipkart')['dresses_page'] do |url|
        page.visit url
      end

      step "Need to press escape " do
        it.escape
      end

      step "User clicks ]second dress link" do
        it.click_second_dress_link
      end
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('flipkart')['page'] do |url|
        page.visit url
      end

      step "Need to press escape " do
        it.escape
      end

      step "User clicks women link" do
        check_element_path :xpath, Flipkart::WOMEN_LINK_TA, Flipkart::WOMEN_LINK_EP
        it.click_women_link :ep
      end

      step "User clicks on dresses link" do
        check_element_path :xpath, Flipkart::DRESSES_LINK_TA, Flipkart::DRESSES_LINK_EP
        it.click_dresses_link :ep
      end

      step "User clicks ]second dress link" do
        check_element_path :xpath, Flipkart::SECOND_PRODUCT_LINK_TA, Flipkart::SECOND_PRODUCT_LINK_EP
        it.click_second_dress_link :ep
      end
    end
  end
end

