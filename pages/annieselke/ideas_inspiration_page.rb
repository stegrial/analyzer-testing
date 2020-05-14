require 'spec_helper'
require_relative '../page_extension'

class IdeasInspirationPage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  IDEAS_INSPIRATION_H2_IL = "//div[@class='header']/h2"
  IDEAS_INSPIRATION_H2_TA = "annieselke:ideas_inspiration_page:ideas_inspiration_h2"


  def should_see_ideas_and_ins_h2(key = nil)
    post_processing key do
      return assert_selector(:xpath, IDEAS_INSPIRATION_H2_IL) if key == :il
      assert_selector(:xpath, ta(IDEAS_INSPIRATION_H2_TA, IDEAS_INSPIRATION_H2_IL))
    end
  end

end