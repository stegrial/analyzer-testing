require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/annieselke/*.rb"

banner_page = BannerPage.new
header_page = HeaderPage.new
pet_page = PetPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Filtering Pet product' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('annieselke')['page'] do |url|
          page.visit url
          banner_page.close_banner
        end

        step "User clicks Pet link on top navigation" do
          header_page.click_pet_link
          banner_page.close_cupon_banner
        end

        step "User clicks filter size medium" do
          pet_page.click_on_filter_size_medium
          pet_page.should_see_filter_size_medium
        end

        step "User clicks filter size medium/large" do
          pet_page.click_on_filter_size_med_lar
          pet_page.should_see_filter_size_med_lar
        end

        step "User clicks dropdown colors" do
          pet_page.click_on_dropdown_colors
        end

        step "User clicks grey color" do
          scroll_to_element 300
          pet_page.click_on_grey_color
          pet_page.should_see_filter_color_grey
        end

        step "User clicks dropdown pattern" do
          scroll_to_element 400
          pet_page.click_on_dropdown_pattern
        end

        step "User clicks Stripe pattern" do
          pet_page.click_on_stripe_pattern
          pet_page.should_see_filter_pat_stripe
        end

        step "User clicks dropdown material" do
          scroll_to_element 500
          pet_page.click_on_dropdown_material
        end

        step "User clicks Polypropylene material" do
          pet_page.click_on_polypropylene_mater
          pet_page.should_see_filter_mater_polyp
        end

        step "User clicks First product link" do
          scroll_to_element 700
          pet_page.click_on_first_product
        end

        sleep 3
      end
    end

  end
end
