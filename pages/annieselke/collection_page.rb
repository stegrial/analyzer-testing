require 'spec_helper'
require_relative '../page_extension'

class CollectionsPage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  COLLECTIONS_H1_IL = "//div[@class='header']/h1"
  COLLECTIONS_H1_TA = "annieselke:collections_page:collections_h1"


  def should_see_collections_h1(key = nil)
    post_processing key do
      return assert_selector(:xpath, COLLECTIONS_H1_IL) if key == :il
      assert_selector(:xpath, ta(COLLECTIONS_H1_TA, COLLECTIONS_H1_IL))
    end
  end

end