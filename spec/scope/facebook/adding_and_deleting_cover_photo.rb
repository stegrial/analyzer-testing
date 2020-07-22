require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/facebook/*.rb"

header_nav = HeaderNaviPageFacebook.new
profile_page = ProfilePageFacebook.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by messenger'  do

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

        step "User click to Add Cover page" do
          profile_page.click_add_cover_page
        end

        step "User click Ok button to layer confirm" do
          profile_page.click_ok_btn_layer_confirm
        end

        step "User click Select Artwork" do
          profile_page.click_select_artwork
        end

        step "User click to select fourth img" do
          profile_page.click_fourth_img
        end

        step "User click save changes" do
          profile_page.click_save_changes
        end

        step "Need to press escape" do
          header_nav.escape :il #step is duplicated below
        end

        step "User click edit cover photo" do
          profile_page.click_edit_cover_photo
        end

        step "User click 'Remove' cover photo" do
          profile_page.click_remove_cover_photo
        end

        step "User click 'Confirm' removing photo" do
          profile_page.click_confirm_removing_btn
        end

        step "User sees 'Add cover photo' text after deleting" do
          profile_page.sees_add_cover_photo_text
        end

        sleep 3
      end
    end

  end
end
