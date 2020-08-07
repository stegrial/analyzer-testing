require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/facebook/*.rb"

header_nav = HeaderNaviPageFacebook.new
profile_page = ProfilePageFacebook.new
bio_page = BioPageFacebook.new

describe 'Preconditions' do

  #
  #
  # check that the cursor is outside the page - there is an element that is available only by hover
  #
  #
  #

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Edit personal info'  do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('facebook')['main_page'] do |url|
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

        step "User  click  profile button" do
          header_nav.click_profile_btn
        end

        step "User  click About button" do
          sleep 4 # wait for il locator(very quickly)
          header_nav.escape :il
          profile_page.click_about_btn
        end

        step "User  click 'Work At'" do
          bio_page.should_see_work_at
          scroll_to_element 500
        end

        step "User  click '+ Add a school' " do
          bio_page.click_add_a_school
        end

        step "User  click '+Add professional skill' input" do
          scroll_to_element 100
          bio_page.click_add_prof_skill
        end

        step "User fill 'professional skill' input", "Quality is our recipe" do |value|
          bio_page.fill_prof_skill value
        end

        step "User click 'Quality is our recipe' in list" do
          bio_page.click_quality_recipe_list
        end

        step "User click 'Save Changes' button" do
          bio_page.click_save_changes
        end

        step "User sees  'Quality is our recipe' text" do
          bio_page.should_see_quality_recipe
        end

        step "User sees hover and click edit skills button" do
          bio_page.hover_and_click_edit_skills
        end

        step "User click Remove skills button" do
          bio_page.click_remove_skills_btn
        end

        step "User click 'Save Changes' button" do
          bio_page.click_save_changes :il #step is duplicated below
        end

        sleep 3
      end
    end

  end
end
