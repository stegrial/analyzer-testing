require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/venus/*.rb"

size_chart_page = SizeChartPage.new
describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Venus - Navigate to Size Chart' do

    $run_count.times do
      scenario 'Recording Locators', "#{$tag}": true do

        step "User goes to the page", settings('venus')['size_chart_page'] do |url|
          page.visit url
        end

        step "User should see a video" do
          size_chart_page.should_see_video
        end

        step "User should see a table" do
          size_chart_page.should_see_sizes_table("Bikini Top Sizing Chart")
        end

      end
    end
  end
end