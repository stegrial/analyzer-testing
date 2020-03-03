require 'spec_helper'
require_relative '../page_extension'

class VenusCategory
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  CAT_DROPDOWN_IL = "//div[@data-page='Category']//div[@id='select-subcategories']"
  CAT_DROPDOWN_TA = 'venus:category_page:cat_dropdown'
  CAT_DROPDOWN_EP = 'EP:venus:category_page:cat_dropdown'

  def subcat_name(locator, name)
    case locator
    when :il then "(//li[text()='#{name[1]}'])[1]"
    when :ta then "venus:category_page:cat_dropdown:#{name[0].tr('^A-Za-z0-9_', '')}#{name[1].tr('^A-Za-z0-9_', '')}"
    when :ep then "EP:venus:category_page:cat_dropdown:#{name[0].tr('^A-Za-z0-9_', '')}#{name[1].tr('^A-Za-z0-9_', '')}"
    else p 'Locator type is not set'
    end
  end


  def open_cat_dropdown(key = nil)
    post_processing key do
      return find(ta(CAT_DROPDOWN_EP)).click if key == :ep
      return find(:xpath, CAT_DROPDOWN_IL).click if key == :il
      find(:xpath, ta(CAT_DROPDOWN_TA, CAT_DROPDOWN_IL)).click
    end
  end

  def choose_subcat_by_first_name(key = nil, name)
    post_processing key do
      return find(ta(subcat_name(:ep, name))).click if key == :ep
      return find(:xpath, subcat_name(:il, name)).click if key == :il
      find(:xpath, ta(subcat_name(:ta, name), subcat_name(:il, name))).click
    end
  end


end



