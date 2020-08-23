require 'spec_helper'
require_relative '../../../../helpers/special_methods'
required_relative_all "/pages/sencha/*.rb"

examples_page = ExamplesPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'View footer' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['examples_page'] do |url|
          page.visit url
        end

        step "User sees social links" do
          examples_page.should_see_facebook_link
          examples_page.should_see_twitter_link
          examples_page.should_see_linkedin_link
          examples_page.should_see_youtube_link
          examples_page.should_see_google_link
          examples_page.should_see_vimeo_link
          examples_page.should_see_github_link
        end

        step "User sees copyright notice existence" do
          examples_page.should_see_sencha_inc
          examples_page.should_see_privacy_police_link
          examples_page.should_see_terms_of_use_link
        end


        sleep 3
      end
    end

  end
end
