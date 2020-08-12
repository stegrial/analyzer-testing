require 'spec_helper'
require_relative '../../../../helpers/special_methods'
required_relative_all "/pages/sencha/*.rb"

examples_page = ExamplesPage.new
forum_page = ForumPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'View Forum page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['examples_page'] do |url|
          page.visit url
        end

        step "User click Forms link on header" do
          examples_page.click_forum_link
        end

        step "User sess header forum title" do
          forum_page.should_see_header_forum_text
        end


        sleep 3
      end
    end

  end
end
