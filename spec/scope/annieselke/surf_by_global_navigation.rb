require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

banner_page = BannerPage.new
header_page = HeaderPage.new
pine_cone_hill_page = PineConeHillPage.new
dash_albert_page = DashAlbertPage.new
outlet_page = OutletPage.new
ideas_inspiration_page = IdeasInspirationPage.new
home_page = HomePage.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'Surfing by global navigation' do

    # Initial locators with Recording

    scenario 'Recording IL', record: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        page.visit url
        banner_page.close_banner
      end

      step "User clicks Pine Cone Hill link on global navigation" do
        header_page.click_pine_cone_hill_link
        pine_cone_hill_page.should_see_pine_cone_hill_img
      end

      step "User clicks Dash an Albert link on global navigation" do
        header_page.click_dash_an_albert_link
        dash_albert_page.should_see_dash_an_albert_img
      end

      step "User clicks The Outlet link on global navigation" do
        header_page.click_the_outlet_link
        outlet_page.should_see_outlet_img
      end

      step "User clicks Ideas and Inspiration link on global navigation" do
        header_page.click_ideals_inspiration_link
        ideas_inspiration_page.should_see_ideas_and_ins_h2
      end

      step "User clicks Annie Selke link on global navigation" do
        header_page.click_annie_selke_link
        home_page.should_see_annie_selke_img
      end


      sleep 3
    end

    scenario 'Searching IL', search: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        page.visit url
        banner_page.close_banner
      end

      step "User clicks Pine Cone Hill link on global navigation" do
        check_element_path :xpath, HeaderPage::PINE_CONE_HILL_LINK_TA, HeaderPage::PINE_CONE_HILL_LINK_IL
        header_page.click_pine_cone_hill_link

        check_element_path :xpath, PineConeHillPage::PINE_CONE_HILL_IMG_TA, PineConeHillPage::PINE_CONE_HILL_IMG_IL
        pine_cone_hill_page.should_see_pine_cone_hill_img
      end

      step "User clicks Dash an Albert link on global navigation" do
        check_element_path :xpath, HeaderPage::DASH_AN_ALBERT_LINK_TA, HeaderPage::DASH_AN_ALBERT_LINK_IL
        header_page.click_dash_an_albert_link

        check_element_path :xpath, DashAlbertPage::DASH_AN_ALBERT_IMG_TA, DashAlbertPage::DASH_AN_ALBERT_IMG_IL
        dash_albert_page.should_see_dash_an_albert_img
      end

      step "User clicks The Outlet link on global navigation" do
        check_element_path :xpath, HeaderPage::THE_OUTLET_LINK_TA, HeaderPage::THE_OUTLET_LINK_IL
        header_page.click_the_outlet_link

        check_element_path :xpath, OutletPage::OUTLET_IMG_TA, OutletPage::OUTLET_IMG_IL
        outlet_page.should_see_outlet_img
      end

      step "User clicks Ideas and Inspiration link on global navigation" do
        check_element_path :xpath, HeaderPage::IDEAS_INSPIRATION_LINK_TA, HeaderPage::IDEAS_INSPIRATION_LINK_IL
        header_page.click_ideals_inspiration_link

        check_element_path :xpath, IdeasInspirationPage::IDEAS_INSPIRATION_H2_TA, IdeasInspirationPage::IDEAS_INSPIRATION_H2_IL
        ideas_inspiration_page.should_see_ideas_and_ins_h2
      end

      step "User clicks Annie Selke link on global navigation" do
        check_element_path :xpath, HeaderPage::ANNIE_SELKE_LINK_TA, HeaderPage::ANNIE_SELKE_LINK_IL
        header_page.click_annie_selke_link

        check_element_path :xpath, HomePage::ANNIE_SELKE_IMG_TA, HomePage::ANNIE_SELKE_IMG_IL
        home_page.should_see_annie_selke_img
      end

      sleep 3
    end
  end
end
