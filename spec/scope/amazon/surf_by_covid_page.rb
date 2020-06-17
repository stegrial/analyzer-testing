require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/amazon/*.rb"


covid_page = CovidPage.new


describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by Covid page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('amazon')['covid'] do |url|
          page.visit url
        end

        step "User sees Covid Blog h1" do
          covid_page.should_see_covid_19_blog
        end

        step "User click hamburger menu" do
          covid_page.click_hamburger_menu
        end

        step "User sees books and authors item" do
          covid_page.should_see_books_and_author
        end

        step "User click sustainability item" do
          covid_page.click_sustainability_item
          move_between_tabs
        end

        step "User click header logo" do
          covid_page.click_menu_close_btn
        end

        step "User click header logo" do
          covid_page.click_header_logo
        end

        step "User sees date on page" do
          covid_page.should_see_date_on_page
        end

        step "User click prioritizing link" do
          covid_page.click_prioritizing_link
        end

        step "User click our position link" do
          covid_page.click_our_position_link
          move_between_tabs
        end

        step "User click our position link" do
          covid_page.click_our_position_link
          move_between_tabs
        end

        step "User click Amazon Covid Blog link" do
          covid_page.click_covid_blog_link
        end

        step "User click Facebook top icon " do
          covid_page.click_facebook_top_icon
          move_between_tabs
        end

        step "User click Linkedin top icon " do
          covid_page.click_linkedin_bottom_icon
          move_between_tabs
        end

        step "User click Popular Today" do
          covid_page.should_see_popular_today
        end

        step "User click Play button for first video on page" do
          covid_page.click_play_1st_video
        end

        step "User sees tags panel in bottom" do
          covid_page.should_see_tags_panel
        end

        step "User click Learn More button" do
          covid_page.click_learn_more_btn
        end
      end
    end
  end
end
