require 'spec_helper'
class TheTiebarRewardsPage

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  VIEW_MY_REWARDS_IL = "(//div[text()='View My Rewards'])[1]"
  VIEW_MY_REWARDS_TA = "thetiebar:rewards_page:view_my_rewards"
  VIEW_MY_REWARDS_EP = "EP:thetiebar:rewards_page:view_my_rewards"

  LEARN_MORE_HERE_IL = "(//a[@href='/loyalty-rewards-program'])[1]"
  LEARN_MORE_HERE_TA = "thetiebar:rewards_page:learn_more_link"
  LEARN_MORE_HERE_EP = "EP:thetiebar:rewards_page:learn_more_link"

  FAQ_SECTION_IL =  "(//a[contains(text(), 'For more details, visit the FAQ section')])[1]"
  FAQ_SECTION_TA = "thetiebar:rewards_page:faq_section"
  FAQ_SECTION_EP = "EP:thetiebar:rewards_page:faq_section"

  RETURN_TO_THE_TIE_BAR_LINK_IL = "(//*[contains(text(), ' Return to The Tie Bar')])[1]"
  RETURN_TO_THE_TIE_BAR_LINK_TA = "thetiebar:rewards_page:return_to_thetiebar"
  RETURN_TO_THE_TIE_BAR_LINK_EP = "EP:thetiebar:rewards_page:return_to_thetiebar"


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
end