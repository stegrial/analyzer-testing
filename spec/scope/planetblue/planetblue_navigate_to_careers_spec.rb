require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/planetblue/*.rb"

careers = Careers.new
modal = Modal.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Planet Blue - Navigate to Careers' do

    $run_count.times do
      scenario 'Recording Locators', "#{$tag}": true do

        step "User goes to the page", settings('planetblue')['page'] + 'pages/careers' do |url|
          page.visit url
        end

        step "User checks Careers Header" do
          modal.click_close_policies_button
          careers.should_see_careers_header
        end

        step "User checks Career item", 'Ala Moana Store', 'Assistant Store Manager' do |store, name|
          careers.should_see_career_item store, name
        end

        step "User checks Career item", 'Venice Store', 'Keyholder' do |store, name|
          careers.should_see_career_item store, name
        end

        sleep 3
      end
    end

  end
end
