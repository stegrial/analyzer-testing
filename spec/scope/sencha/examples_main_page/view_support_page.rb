require 'spec_helper'
require_relative '../../../../helpers/special_methods'
required_relative_all "/pages/sencha/*.rb"

examples_page = ExamplesPage.new
support_page = SupportPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'View Support page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['examples_page'] do |url|
          page.visit url
        end

        step "User clicks Support link on header" do
          examples_page.click_support_link
        end

        step "User sess header support title" do
          support_page.should_see_img_header
          support_page.should_see_header_sup_text
        end


        sleep 3
      end
    end

  end
end
