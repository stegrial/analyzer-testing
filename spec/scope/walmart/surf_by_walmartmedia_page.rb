require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/walmart/*.rb"

include ElementSearchValidation

media_page = WalmartMediaPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by walmart media page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('walmart')['walmartmedia_page'] do |url|
          page.visit url
        end

        step "User sees 'Here for You' H3" do
          media_page.should_see_here_for_you
        end

        step "User clicks on 'Get started' button" do
          media_page.click_on_get_started_btn
          page.go_back
        end

        step "User clicks arrow next on slider" do
          media_page.click_next_arrow
        end

        step "User sees 'Massive scale' H2" do
          media_page.should_see_massive_scale_h2
        end

        step "User clicks Source 1st link" do
          media_page.click_source1
        end

        step "User  clicks Source 2nd link" do
          media_page.click_source2
        end

        step "User sees Influence customers H2" do
          media_page.should_see_influence_customers
        end

        step "User clicks 'Discovered Today' link" do
          media_page.click_discovered_today
          page.go_back
        end

        step "User clicks 'Close the omnichannel loop' link" do
          media_page.click_close_omnichannel_loop
          page.go_back
        end

        step "User 'Put the power of Walmart to work' link" do
          media_page.click_put_the_power
          page.go_back
        end

        step "User 'Read More' button" do
          media_page.click_read_more_btn
        end
      end
    end
  end
end