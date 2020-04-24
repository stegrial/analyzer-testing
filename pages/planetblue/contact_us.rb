require 'spec_helper'
require_relative '../page_extension'

class ContactUs

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  def contact_us_item(key, name, text)
    locator_by key, "//*[@class='panel__title' and text()='#{name}']//ancestor::*[@class='content-grid__item']//*[@class='panel__body']//*[text()='#{text}']",
               "planetblue:contact_us:item:#{ta_name(name)}"
  end

  def find_contact_us_item(key = nil, name, text)
    find_element_path key, :xpath, contact_us_item(:ta, name, text), contact_us_item(:il, name, text)
  end

end