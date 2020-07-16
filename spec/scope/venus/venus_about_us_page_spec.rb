require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/venus/*.rb"

navigation = VenusNavigation.new
about_us_page = AboutUsPage.new
describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Venus - Navigate to About Us Page' do

    $run_count.times do
      scenario 'Recording Locators', "#{$tag}": true do

        step "User goes to the page", settings('venus')['about_us_page'] do |url|
          page.visit url
        end

        step "User checks page Header", 'ABOUT US' do |title|
          navigation.should_see_page_header title
        end

        step "User checks About Us text" do
          about_us_page.should_see_about_us_text 'At VENUS, we believe apparel and swimwear are empowering.'
        end

        step "User checks About Us Image" do
          about_us_page.should_see_about_us_image
        end

      end
    end
  end
end