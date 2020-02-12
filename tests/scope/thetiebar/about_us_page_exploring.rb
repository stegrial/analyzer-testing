require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/thetiebar/*.rb"

about_us_page = TheTiebarAboutUs.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'About Us page exploring' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('thetiebar')['about_us_page'] do |url|
        page.visit url
      end

      step "User click the next slider button" do
        about_us_page.click_next_slider
      end

      step "User clicks on previous slider button" do
        about_us_page.click_previous_slider
      end

      step "User click next history  button" do
        about_us_page.click_next_history_slider
      end

      step "User clicks on previous history button" do
        about_us_page.click_previous_history_slider
      end

      step "User clicks find store  button" do
        about_us_page.click_find_store_btn
      end

      step "User check ABOUT OUR TIE BAR STORES" do
        about_us_page.should_see_about_our_stores_h1
      end
    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['about_us_page'] do |url|
        page.visit url
      end

      step "User click the next slider button" do
        check_element_path :xpath, TheTiebarAboutUs::NEXT_IMG_SLIDER_TA, TheTiebarAboutUs::NEXT_IMG_SLIDER_IL
        about_us_page.click_next_slider
      end

      step "User clicks on previous slider button" do
        check_element_path :xpath, TheTiebarAboutUs::PREVIOUS_IMG_SLIDER_TA, TheTiebarAboutUs::PREVIOUS_IMG_SLIDER_IL
        about_us_page.click_previous_slider
      end

      step "User click next history  button" do
        check_element_path :xpath, TheTiebarAboutUs::NEXT_HISTORY_SLIDER_TA, TheTiebarAboutUs::NEXT_HISTORY_SLIDER_IL
        about_us_page.click_next_history_slider
      end

      step "User clicks on previous history button" do
        check_element_path :xpath, TheTiebarAboutUs::PREVIOUS_HISTORY_SLIDER_TA, TheTiebarAboutUs::PREVIOUS_HISTORY_SLIDER_IL
        about_us_page.click_previous_history_slider
      end

      step "User clicks find store  button" do
        check_element_path :xpath, TheTiebarAboutUs::FIND_STORE_BTN_TA, TheTiebarAboutUs::FIND_STORE_BTN_IL
        about_us_page.click_find_store_btn
      end

      step "User check ABOUT OUR TIE BAR STORES" do
        check_element_path :xpath, TheTiebarAboutUs::ABOUT_OUR_STORES_H1_TA, TheTiebarAboutUs::ABOUT_OUR_STORES_H1_IL
        about_us_page.should_see_about_our_stores_h1
      end
    end

    # Element Picker from Repository
    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['about_us_page'] do |url|
        page.visit url
      end

      step "User click the next slider button" do
        check_element_path :xpath, TheTiebarAboutUs::NEXT_IMG_SLIDER_EP, TheTiebarAboutUs::NEXT_IMG_SLIDER_IL
        about_us_page.click_next_slider :ep
      end

      step "User clicks on previous slider button" do
        check_element_path :xpath, TheTiebarAboutUs::PREVIOUS_IMG_SLIDER_EP, TheTiebarAboutUs::PREVIOUS_IMG_SLIDER_IL
        about_us_page.click_previous_slider :ep
      end

      step "User click next history  button" do
        check_element_path :xpath, TheTiebarAboutUs::NEXT_HISTORY_SLIDER_EP, TheTiebarAboutUs::NEXT_HISTORY_SLIDER_IL
        about_us_page.click_next_history_slider :ep
      end

      step "User clicks on previous history button" do
        check_element_path :xpath, TheTiebarAboutUs::PREVIOUS_HISTORY_SLIDER_EP, TheTiebarAboutUs::PREVIOUS_HISTORY_SLIDER_IL
        about_us_page.click_previous_history_slider :ep
      end

      step "User clicks find store  button" do
        check_element_path :xpath, TheTiebarAboutUs::FIND_STORE_BTN_EP, TheTiebarAboutUs::FIND_STORE_BTN_IL
        about_us_page.click_find_store_btn :ep
      end

      step "User check ABOUT OUR TIE BAR STORES" do
        check_element_path :xpath, TheTiebarAboutUs::ABOUT_OUR_STORES_H1_EP, TheTiebarAboutUs::ABOUT_OUR_STORES_H1_IL
        about_us_page.should_see_about_our_stores_h1 :ep
      end
    end
  end
end