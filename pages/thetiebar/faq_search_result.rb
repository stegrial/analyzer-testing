require 'spec_helper'

class TheTiebarFaqSearchResult

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  VIEW_MY_REWARDS_IL = "(//div[text()='View My Rewards'])[1]"
  VIEW_MY_REWARDS_TA = "thetiebar:faq_page:view_my_rewards"
  VIEW_MY_REWARDS_EP = "EP:thetiebar:faq_page:view_my_rewards"

  LEARN_MORE_HERE_IL = "(//a[@href='/loyalty-rewards-program'])[1]"
  LEARN_MORE_HERE_TA = "thetiebar:faq_page:learn_more_link"
  LEARN_MORE_HERE_EP = "EP:thetiebar:faq_page:learn_more_link"

  FAQ_SECTION_IL =  "(//a[contains(text(), 'For more details, visit the FAQ section')])[1]"
  FAQ_SECTION_TA = "thetiebar:faq_page:faq_section"
  FAQ_SECTION_EP = "EP:thetiebar:faq_page:faq_section"

  RETURN_TO_THE_TIE_BAR_LINK_IL = "(//*[contains(text(), ' Return to The Tie Bar')])[1]"
  RETURN_TO_THE_TIE_BAR_LINK_TA = "thetiebar:faq_page:return_to_thetiebar"
  RETURN_TO_THE_TIE_BAR_LINK_EP = "EP:thetiebar:faq_page:return_to_thetiebar"

  WHAT_SIZE_NECKTIES_IL = "//zd-autocomplete-option[@tabindex='1']"
  WHAT_SIZE_NECKTIES_TA = "thetiebar:faq_page:size_neckties"
  WHAT_SIZE_NECKTIES_EP = "EP:thetiebar:faq_page:size_neckties"

  TIE_BAR_BREADCRUMBS_IL = "//ol[@class='breadcrumbs']/li[@title='The Tie Bar']"
  TIE_BAR_BREADCRUMBS_TA = "thetiebar:faq_page:breadcrumb_tiebar"
  TIE_BAR_BREADCRUMBS_EP = "EP:thetiebar:faq_page:breadcrumb_tiebar"

  FAQ_SEARCH_BTN_IL = "//button[@class='search-btn']"
  FAQ_SEARCH_BTN_TA = "thetiebar:faq_page:faq_search_btn"
  FAQ_SEARCH_BTN_EP = "EP:thetiebar:faq_page:faq_search_btn"

  KNOWLEDGE_BASE_NECKTIES_IL = "(//*[contains(text(), 'What size are your neckties?')])[1]"
  KNOWLEDGE_BASE_NECKTIES_TA = "thetiebar:faq_page:knowledge_size_neckties"
  KNOWLEDGE_BASE_NECKTIES_EP = "EP:thetiebar:faq_page:knowledge_size_neckties"

  FAQ_SEARCH_INPUT_IL = "//input[contains(@id, 'query')]"
  FAQ_SEARCH_INPUT_TA = "thetiebar:faq_page:faq_search_input"
  FAQ_SEARCH_INPUT_EP = "EP:thetiebar:faq_page:faq_search_input"


  def click_view_my_rewards(key = nil)
    return find(ta(VIEW_MY_REWARDS_EP)).click if key == :ep
    return find(:xpath, VIEW_MY_REWARDS_IL).click if key == :il
    find(:xpath, ta(VIEW_MY_REWARDS_TA, VIEW_MY_REWARDS_IL)).click
  end

  def click_learn_more_link(key = nil)
    return find(ta(LEARN_MORE_HERE_EP)).click if key == :ep
    return find(:xpath, LEARN_MORE_HERE_IL).click if key == :il
    find(:xpath, ta(LEARN_MORE_HERE_TA, LEARN_MORE_HERE_IL)).click
  end

  def click_faq_section_link(key = nil)
    return find(ta(FAQ_SECTION_EP)).click if key == :ep
    return find(:xpath, FAQ_SECTION_IL).click if key == :il
    find(:xpath, ta(FAQ_SECTION_EP, FAQ_SECTION_IL)).click
  end

  def click_size_neckties(key = nil)
    return find(ta(WHAT_SIZE_NECKTIES_EP)).click if key == :ep
    return find(:xpath, WHAT_SIZE_NECKTIES_IL).click if key == :il
    find(:xpath, ta(WHAT_SIZE_NECKTIES_TA, WHAT_SIZE_NECKTIES_IL)).click
  end

  def click_breadcrumb_tiebar(key = nil)
    return find(ta(TIE_BAR_BREADCRUMBS_EP)).click if key == :ep
    return find(:xpath, TIE_BAR_BREADCRUMBS_IL).click if key == :il
    find(:xpath, ta(TIE_BAR_BREADCRUMBS_TA, TIE_BAR_BREADCRUMBS_IL)).click
  end

  def click_faq_search_btn(key = nil)
    return find(ta(FAQ_SEARCH_BTN_EP)).click if key == :ep
    return find(:xpath, FAQ_SEARCH_BTN_IL).click if key == :il
    find(:xpath, ta(FAQ_SEARCH_BTN_TA, FAQ_SEARCH_BTN_IL)).click
  end

  def click_knowledge_base_neckties(key = nil)
    return find(ta(KNOWLEDGE_BASE_NECKTIES_EP)).click if key == :ep
    return find(:xpath, KNOWLEDGE_BASE_NECKTIES_IL).click if key == :il
    find(:xpath, ta(KNOWLEDGE_BASE_NECKTIES_TA, KNOWLEDGE_BASE_NECKTIES_IL)).click
  end

  def fill_faq_search_input(key = nil, value)
    return find(ta(FAQ_SEARCH_INPUT_EP)).set(value) if key == :ep
    return find(:xpath, FAQ_SEARCH_INPUT_IL).set(value) if key == :il
    find(:xpath, ta(FAQ_SEARCH_INPUT_TA, FAQ_SEARCH_INPUT_IL)).set(value)
  end
end