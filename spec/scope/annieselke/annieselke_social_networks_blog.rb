require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

home_page = HomePage.new
header_page = HeaderPage.new

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
        header_page.close_banner
        header_page.close_cupon_banner
      end

      step "User clicks on Fresh American Style blog" do
        home_page.click_blog_link
      end

      sleep 5 # wait until page and tree is load

      step "User clicks on Social networks icons" do
        header_page.close_cupon_banner
        home_page.click_on_facebook_icon

        move_between_tabs
        header_page.close_cupon_banner
        home_page.click_on_twitter_icon

        move_between_tabs
        header_page.close_cupon_banner
        home_page.click_on_pinterest_icon

        move_between_tabs
        header_page.close_cupon_banner
        home_page.click_on_youtube_icon

        move_between_tabs
        header_page.close_cupon_banner
        home_page.click_on_instagram_icon
      end
    end


    scenario 'Searching IL', search: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
      end

      step "Close banners" do
        header_page.close_banner
        header_page.close_cupon_banner
      end

      step "User clicks on Fresh American Style blog" do
        check_element_path :xpath, HomePage::BLOG_LINK_TA, HomePage::BLOG_LINK_IL
        home_page.click_blog_link
      end

      step "User clicks on Social networks icons" do
        header_page.close_cupon_banner
        check_element_path :xpath, HomePage::SOCIAL_NETWORKS_TA[:facebook], HomePage::SOCIAL_NETWORKS_IL[:facebook]
        home_page.click_on_facebook_icon

        move_between_tabs
        header_page.close_cupon_banner
        check_element_path :xpath, HomePage::SOCIAL_NETWORKS_TA[:twitter], HomePage::SOCIAL_NETWORKS_IL[:twitter]
        home_page.click_on_twitter_icon

        move_between_tabs
        header_page.close_cupon_banner
        check_element_path :xpath, HomePage::SOCIAL_NETWORKS_TA[:pinterest], HomePage::SOCIAL_NETWORKS_IL[:pinterest]
        home_page.click_on_pinterest_icon

        move_between_tabs
        header_page.close_cupon_banner
        check_element_path :xpath, HomePage::SOCIAL_NETWORKS_TA[:youtube], HomePage::SOCIAL_NETWORKS_IL[:youtube]
        home_page.click_on_youtube_icon

        move_between_tabs
        header_page.close_cupon_banner
        check_element_path :xpath, HomePage::SOCIAL_NETWORKS_TA[:instagram], HomePage::SOCIAL_NETWORKS_IL[:instagram]
        home_page.click_on_instagram_icon
      end
    end
  end
end
