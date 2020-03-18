require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/planetblue/*.rb"

include ElementSearchValidation

menu = Menu.new
login = Login.new
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end


  feature 'Planet Blue - Login' do

    scenario 'Recording Locators', record: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks Login Button" do
        menu.click_user_button
      end

      step "User fills EMAIL, PASSWORD Fields and clicks 'Sign In' Button",
           settings('planetblue')['email'],
           settings('planetblue')['password'] do |email, password|
        login.fill_email_field email
        login.fill_password_field password
        login.click_sign_in_button
      end

      # step "User checks found items", 'RUTH TUNIC | New' do |value|
      #   planetblue.total_items 2
      #   planetblue.find_collection_item value, 'ruth-tunic?'
      #   planetblue.find_collection_item value, 'ruth-tunic-1?'
      # end

    end


    scenario 'Searching Locators', search: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

    end

  end
end