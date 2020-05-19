require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

home_page = HomePage.new
banner_page = BannerPage.new
footer_page = FooterPage.new

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
        banner_page.close_banner
        banner_page.close_cupon_banner
      end

      step "User clicks on Fresh American Style blog" do
        footer_page.click_blog_link
      end

      sleep 5 # wait until page and tree is load

      step "User clicks on Social networks icons" do
        banner_page.close_cupon_banner
        footer_page.click_on_facebook_icon

        move_between_tabs
        banner_page.close_cupon_banner
        footer_page.click_on_twitter_icon

        move_between_tabs
        banner_page.close_cupon_banner
        footer_page.click_on_pinterest_icon

        move_between_tabs
        banner_page.close_cupon_banner
        footer_page.click_on_youtube_icon

        move_between_tabs
        banner_page.close_cupon_banner
        footer_page.click_on_instagram_icon
      end

      sleep 3
    end


    scenario 'Searching IL', search: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
      end

      step "Close banners" do
        banner_page.close_banner
        banner_page.close_cupon_banner
      end

      step "User clicks on Fresh American Style blog" do
        check_element_path :xpath, FooterPage::BLOG_LINK_TA, FooterPage::BLOG_LINK_IL
        footer_page.click_blog_link
      end

      step "User clicks on Social networks icons" do
        banner_page.close_cupon_banner
        check_element_path :xpath, FooterPage::SOCIAL_NETWORKS_TA[:facebook], FooterPage::SOCIAL_NETWORKS_IL[:facebook]
        footer_page.click_on_facebook_icon

        move_between_tabs
        banner_page.close_cupon_banner
        check_element_path :xpath, FooterPage::SOCIAL_NETWORKS_TA[:twitter], FooterPage::SOCIAL_NETWORKS_IL[:twitter]
        footer_page.click_on_twitter_icon

        move_between_tabs
        banner_page.close_cupon_banner
        check_element_path :xpath, FooterPage::SOCIAL_NETWORKS_TA[:pinterest], FooterPage::SOCIAL_NETWORKS_IL[:pinterest]
        footer_page.click_on_pinterest_icon

        move_between_tabs
        banner_page.close_cupon_banner
        check_element_path :xpath, FooterPage::SOCIAL_NETWORKS_TA[:youtube], FooterPage::SOCIAL_NETWORKS_IL[:youtube]
        footer_page.click_on_youtube_icon

        move_between_tabs
        banner_page.close_cupon_banner
        check_element_path :xpath, FooterPage::SOCIAL_NETWORKS_TA[:instagram], FooterPage::SOCIAL_NETWORKS_IL[:instagram]
        footer_page.click_on_instagram_icon
      end

      sleep 3
    end
  end
end
