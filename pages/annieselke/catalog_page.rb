require 'spec_helper'
require_relative '../page_extension'

class CatalogPage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  REQUEST_CATALOG_IL = "//a[text()='request a catalog']"
  REQUEST_CATALOG_TA = "annieselke:home_page:catalog_page:request_catalog"

  def click_request_catalog(key=nil)
    find_element_path(key, :xpath, REQUEST_CATALOG_TA, REQUEST_CATALOG_IL).click
  end
end

