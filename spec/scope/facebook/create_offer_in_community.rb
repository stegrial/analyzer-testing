require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/facebook/*.rb"

header_nav = HeaderNaviPageFacebook.new
community_page = CommunityPageFacebook.new
offer_modal = OfferPageFacebook.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Creating an offer on community page'  do

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
          community_page.click_offer_btn
        end

        step "User click Discount percent dropdown" do
          offer_modal.click_discount_percent
        end

        step "User click Offer Type" do
          offer_modal.click_offer_type
        end

        step "User fill discount amount ", "20" do |value|
          offer_modal.fill_discount_amount value
        end

        step "User fill discount items ", "tea, beer" do |value|
          offer_modal.fill_discounted_items value
        end

        step "User click Add descriptions" do
          offer_modal.click_add_descriptions
        end

        step "User fill description", "test trueautomation" do |value|
          offer_modal.fill_description_offer value
        end

        step "User fill expires date", "12/12/2020\n" do |value|
          offer_modal.fill_expires_date value
        end

        step "User click In-store checkbox" do
          offer_modal.click_in_store_checkbox
        end

        step "User click Primary Action dropdown" do
          offer_modal.click_primary_action
        end

        step "User select Send Message item" do
          offer_modal.select_send_message
        end

        step "User click '+ Terms And Conditions'" do
          offer_modal.click_terms_and_conditions
        end

        step "User fill Terms And Conditions textarea", "test trueautomation 2" do |value|
          offer_modal.fill_terms_and_conditions value
        end

        step "User click 'Choose Photo from' button" do
          offer_modal.click_choose_from_photos
        end

        step "User select first photo" do
          offer_modal.click_first_photo
        end

        step "User click Publish button" do
          offer_modal.click_publish_offer_btn
        end

        step "User  click to open community story option" do
          scroll_to_element 1000
          community_page.click_to_open_story_option
        end

        step "User click Delete from Page" do
          community_page.click_to_delete_post
        end

        step "User  click to accept delete post in community" do
          community_page.click_to_accept_delete_post
        end

        sleep 3
      end
    end

  end
end
