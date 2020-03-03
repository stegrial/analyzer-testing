require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/thetiebar/*.rb"

include ElementSearchValidation

faq_page = TheTiebarFaqPage.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'FAQ page - search query' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('thetiebar')['faq_page'] do |url|
        page.visit url
      end

      step "User fill FAQ search input", 'size' do |search_query|
        faq_page.fill_faq_search_input  search_query
      end

      step "User  clicks to select search query" do
        sleep 3
        faq_page.click_size_neckties
      end

      step "User breadcrumb tiebar" do
        faq_page.click_breadcrumb_tiebar
      end

      step "User fill FAQ search input", 'size' do |search_query|
        faq_page.fill_faq_search_input  search_query
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

    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['faq_page'] do |url|
        page.visit url
      end

      step "User fill FAQ search input", 'size' do |search_query|
        check_element_path :xpath, faq_search_result_page::FAQ_SEARCH_INPUT_TA, faq_search_result_page::FAQ_SEARCH_INPUT_IL
        faq_page.fill_faq_search_input  :il, search_query
      end

      step "User  clicks to select search query" do
        check_element_path :xpath, faq_search_result_page::WHAT_SIZE_NECKTIES_TA, faq_search_result_page::WHAT_SIZE_NECKTIES_IL
        faq_page.click_size_neckties
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, faq_search_result_page::TIE_BAR_BREADCRUMBS_TA, faq_search_result_page::TIE_BAR_BREADCRUMBS_IL
        faq_page.click_breadcrumb_tiebar
      end

      step "User fill FAQ search input", 'size' do |search_query|
        check_element_path :xpath, faq_search_result_page::FAQ_SEARCH_INPUT_TA, faq_search_result_page::FAQ_SEARCH_INPUT_IL
        faq_page.fill_faq_search_input  search_query
      end

      step "User clicks search button" do
        check_element_path :xpath, faq_search_result_page::FAQ_SEARCH_BTN_TA, faq_search_result_page::FAQ_SEARCH_BTN_IL
        faq_page.click_faq_search_btn
      end

      step "User clicks second query of knowledge base(clicks 'What size are your neckties?')" do
        check_element_path :xpath, faq_search_result_page::KNOWLEDGE_BASE_NECKTIES_TA, faq_search_result_page::KNOWLEDGE_BASE_NECKTIES_IL
        faq_page.click_knowledge_base_neckties
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, faq_search_result_page::TIE_BAR_BREADCRUMBS_TA, faq_search_result_page::TIE_BAR_BREADCRUMBS_IL
        faq_page.click_breadcrumb_tiebar
      end

    end

    # Element Picker from Repository
    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['faq_page'] do |url|
        page.visit url
      end

      step "User fill FAQ search input", 'size' do |search_query|
        check_element_path :xpath, faq_search_result_page::FAQ_SEARCH_INPUT_EP, faq_search_result_page::FAQ_SEARCH_INPUT_IL
        faq_page.fill_faq_search_input  :ep, search_query
      end

      step "User  clicks to select search query" do
        check_element_path :xpath, faq_search_result_page::WHAT_SIZE_NECKTIES_EP, faq_search_result_page::WHAT_SIZE_NECKTIES_IL
        faq_page.click_size_neckties :ep
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, faq_search_result_page::TIE_BAR_BREADCRUMBS_EP, faq_search_result_page::TIE_BAR_BREADCRUMBS_IL
        faq_page.click_breadcrumb_tiebar :ep
      end

      step "User fill FAQ search input", 'size' do |search_query|
        check_element_path :xpath, faq_search_result_page::FAQ_SEARCH_INPUT_EP, faq_search_result_page::FAQ_SEARCH_INPUT_IL
        faq_page.fill_faq_search_input  :ep, search_query
      end

      step "User clicks search button" do
        check_element_path :xpath, faq_search_result_page::FAQ_SEARCH_BTN_EP, faq_search_result_page::FAQ_SEARCH_BTN_IL
        faq_page.click_faq_search_btn :ep
      end

      step "User clicks second query of knowledge base(clicks 'What size are your neckties?')" do
        check_element_path :xpath, faq_search_result_page::KNOWLEDGE_BASE_NECKTIES_EP, faq_search_result_page::KNOWLEDGE_BASE_NECKTIES_IL
        faq_page.click_knowledge_base_neckties :ep
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, faq_search_result_page::TIE_BAR_BREADCRUMBS_EP, faq_search_result_page::TIE_BAR_BREADCRUMBS_IL
        faq_page.click_breadcrumb_tiebar :ep
      end
    end
  end
end