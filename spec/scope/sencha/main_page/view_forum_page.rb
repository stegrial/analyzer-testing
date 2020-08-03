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

  feature 'View Forms page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['examples_page'] do |url|
          page.visit url
        end

        step "User click Forms link on header" do
          examples_page.click_forum_link
        end

        step "User sees header links" do
          forum_page.should_see_header_products_link
          forum_page.should_see_header_services_link
          forum_page.should_see_header_pricing_link
          forum_page.should_see_header_developers_link
          forum_page.should_see_header_try_link
          forum_page.should_see_header_buy_link
        end

        step "User fill any text on Sencha Search", "text" do |text|
          forum_page.fill_sencha_search_field(text)
        end

        step "User Log In on Sencha", "1", "132" do |username, password|
          forum_page.fill_username_field(username)
          forum_page.click_password_text
          forum_page.fill_password_field(password)
          forum_page.click_remember_me
          forum_page.click_login_button
        end

        step "User sees Sencha Forums Message" do
          forum_page.should_see_here_link
          forum_page.should_see_register_link
        end


        sleep 3
      end
    end

  end
end
