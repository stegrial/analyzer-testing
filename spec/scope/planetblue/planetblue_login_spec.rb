require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/planetblue/*.rb"

include ElementSearchValidation

planetblue = PlanetBlue.new
menu = Menu.new
login = Login.new
modal = Modal.new
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end


  feature 'Planet Blue - Login' do

    scenario 'Recording Locators', record: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User closes Policies Modal" do
        modal.click_close_policies_button
      end

      step "User clicks Menu Button" do
        menu.click_menu_button
      end

      step "User closes Discount Modal if required" do
        modal.click_close_discount_button
      end

      step "User clicks User Account Button" do
        menu.click_user_button
      end

      step "User fills EMAIL, PASSWORD Fields and clicks 'Login' Button",
           settings('planetblue')['email'],
           settings('planetblue')['pass'] do |email, password|
        login.fill_email_field email
        login.fill_password_field password
        login.click_sign_in_button
      end

    end


    scenario 'Searching Locators', search: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

    end

  end
end