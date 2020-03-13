require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

home_page = Home_Page.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'Navigation to social networks' do

    # Initial locators with Recording

    scenario 'Recording IL', record: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
      end

      step "Close banners" do
        home_page.close_banner
        home_page.close_cupon_banner
      end

      step "User clicks on Fresh American Style blog" do
        home_page.click_blog_link
      end

      step "User clicks on Social networks icons" do
        home_page.close_cupon_banner
        home_page.click_on_facebook_icon

        move_between_tabs
        home_page.close_cupon_banner
        home_page.click_on_twitter_icon

        move_between_tabs
        home_page.close_cupon_banner
        home_page.click_on_pinterest_icon

        move_between_tabs
        home_page.close_cupon_banner
        home_page.click_on_youtube_icon

        move_between_tabs
        home_page.close_cupon_banner
        home_page.click_on_instagram_icon
      end
    end


    scenario 'Searching IL', search: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
      end

      step "Close banners" do
        home_page.close_banner
        home_page.close_cupon_banner
      end

      step "User clicks on Fresh American Style blog" do
        check_element_path :xpath, Home_Page::BLOG_LINK_TA, Home_Page::BLOG_LINK_IL
        home_page.click_blog_link
      end

      step "User clicks on Social networks icons" do
        home_page.close_cupon_banner
        check_element_path :xpath, Home_Page::SOCIAL_NETWORKS_TA[:facebook], Home_Page::SOCIAL_NETWORKS_IL[:facebook]
        home_page.click_on_facebook_icon

        move_between_tabs
        home_page.close_cupon_banner
        check_element_path :xpath, Home_Page::SOCIAL_NETWORKS_TA[:twitter], Home_Page::SOCIAL_NETWORKS_IL[:twitter]
        home_page.click_on_twitter_icon

        move_between_tabs
        home_page.close_cupon_banner
        check_element_path :xpath, Home_Page::SOCIAL_NETWORKS_TA[:pinterest], Home_Page::SOCIAL_NETWORKS_IL[:pinterest]
        home_page.click_on_pinterest_icon

        move_between_tabs
        home_page.close_cupon_banner
        check_element_path :xpath, Home_Page::SOCIAL_NETWORKS_TA[:youtube], Home_Page::SOCIAL_NETWORKS_IL[:youtube]
        home_page.click_on_youtube_icon

        move_between_tabs
        home_page.close_cupon_banner
        check_element_path :xpath, Home_Page::SOCIAL_NETWORKS_TA[:instagram], Home_Page::SOCIAL_NETWORKS_IL[:instagram]
        home_page.click_on_instagram_icon
      end
    end
  end
end
