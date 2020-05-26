require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/thetiebar/*.rb"

faq_page = TheTiebarFaqPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'FAQ page - search query' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('thetiebar')['faq_page'] do |url|
          page.visit url
        end

        step "User fill FAQ search input", 'size' do |search_query|
          faq_page.fill_faq_search_input :il, search_query # step is duplicated below
        end

        step "User clicks to select search query" do
          faq_page.click_size_neckties
        end

        step "User breadcrumb tiebar" do
          faq_page.click_breadcrumb_tiebar :il # step is duplicated below
        end

        step "User fill FAQ search input", 'size' do |search_query|
          faq_page.fill_faq_search_input search_query
        end

        step "User clicks search button" do
          faq_page.click_faq_search_btn
        end

        step "User clicks second query of knowledge base(clicks 'What size are your neckties?')" do
          faq_page.click_knowledge_base_neckties
        end

        step "User breadcrumb tiebar" do
          faq_page.click_breadcrumb_tiebar
        end

        sleep 3
      end
    end

  end
end
