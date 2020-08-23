require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/facebook/*.rb"

header_nav = HeaderNaviPageFacebook.new
community_page = CommunityPageFacebook.new
job_modal = JobModalPageFacebook.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Creating a job on community page'  do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('facebook')['community_page'] do |url|
          page.visit url
        end
        step "User set login in login field", settings('facebook')['login'] do |value|
          header_nav.set_email value
        end

        step "User set password in password field", settings('facebook')['pass'] do |value|
          header_nav.set_pass value
        end

        step "User  clicks on the login button for entering into account" do
          header_nav.click_login_btn
        end

        step "Need to press escape" do
          header_nav.escape
        end

        step "User click Offer button" do
          community_page.click_job_btn
        end

        step "User click Create Job h3" do
          job_modal.should_see_create_job_h3
        end

        step "User fill  Job Title", "Quality Assurance Tester\n" do |value|
          job_modal.fill_job_title value
        end

        step "User click job location", "Odessa Road" do |value|
          job_modal.click_job_location value
        end

        step "User click Odessa Road location" do
          job_modal.click_odessa_road
        end

        step "User fill salary minimum", "1000" do |value|
          job_modal.fill_salary_minimum value
        end

        step "User fill salary minimum", "5000" do |value|
          job_modal.fill_salary_maximum value
        end

        step "User click Per Hour dropdown" do
          job_modal.click_per_hour
        end

        step "User select Per Month from list" do
          job_modal.click_per_month
        end

        step "User click Job Type" do
          job_modal.click_job_type
        end

        step "User click Internship Type" do
          job_modal.click_internship_type
        end

        step "User fill Job Description", "test write" do |value|
          job_modal.click_job_description value
        end

        step "User click Remove App question" do
          job_modal.click_remove_app_question
        end

        step "User click Use Cover Photo" do
          job_modal.click_use_cover_photo
        end

        step "User fill Receive Applications by Email (optional) field", "tester@email.com" do |value|
          job_modal.click_receive_app_email value
        end

        step "User click Preview Job link" do
          job_modal.click_preview_job_link
        end

        step "User sees Preview Job link" do
          job_modal.should_see_preview_job_text
        end

        step "User click close preview modal" do
          job_modal.click_close_job_preview_modal
        end

        step "User  click Close btn to close create job modal" do
          job_modal.click_close_create_job_modal
        end

        step "User  click Discard btn" do
          job_modal.click_discard_btn
        end

        sleep 3
      end
    end

  end
end
