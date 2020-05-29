require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/ta_pages/*.rb"

footer_navigation = FooterNavigation.new
doc_page = DocPage.new
home_page = HomePage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by footer navigation' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('ta')['product_page'] do |url|
          page.visit url
        end

        step "User home button " do
          footer_navigation.click_home_btn
        end

        step "User sees main text on home page" do
          home_page.should_see_main_text
        end

        step "User goes to the page", settings('ta')['use_cases_page'] do |url|
          page.visit url
        end

        step "User footer logo" do
          footer_navigation.click_footer_logo
        end

        step "User sees main text on home page" do
          home_page.should_see_main_text :il #step is duplicated below
        end

        step "User linkedin icon" do
          footer_navigation.click_linkedin_icon
          move_between_tabs
        end

        step "User facebook icon" do
          footer_navigation.click_facebook_icon
          move_between_tabs
        end

        step "User click documentation button" do
          footer_navigation.click_documentation_link
        end

        step "User sees install client text" do
          doc_page.should_see_install_client
        end

        sleep 3
      end
    end

  end
end
