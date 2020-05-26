require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/planetblue/*.rb"

include ElementSearchValidation

careers = Careers.new
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end


  feature 'Planet Blue - Navigate to Careers' do

    scenario 'Recording Locators', record: true do

      step "User goes to the page", settings('planetblue')['page'] + 'pages/careers' do |url|
        page.visit url
      end

      step "User checks Careers Header" do
        careers.find_careers_header
      end

      step "User checks Career item", 'Ala Moana Store', 'Assistant Store Manager' do |store, name|
        careers.find_career_item store, name
      end

      step "User checks Career item", 'Venice Store', 'Keyholder' do |store, name|
        careers.find_career_item store, name
      end

    end
  end
end