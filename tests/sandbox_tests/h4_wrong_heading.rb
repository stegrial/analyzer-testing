require 'spec_helper'
require_relative '../../pages/sandbox_tests'
require_relative '../../helpers/special_methods'

include SandboxTests

feature 'TA-152 TA ignores the attributes of intermediate elements in the DOM tree and finds a wrong elements' do

  # Initial locators with Recording

  scenario 'Recording IL', il_run: true do
    step "User goes to the page", settings('sandbox')['page_h4'] do |url|
      page.visit url
    end

    step "Record the Heading 4 " do
      record_heading_4
    end
    sleep 3
  end

  scenario 'Searching IL', il_run: true do
    step "User goes to the page", settings('sandbox')['page_h4_test_1'] do |url|
      page.visit url
    end

    step "Check the Heading 4" do
      check_element_path @second_heading_ta, @second_heading_il
      check_heading_4
    end
    sleep 3
  end

  # Debug

  scenario 'Recording debug', rec_debug: true do
    step "User goes to the page", settings('sandbox')['page_h4'] do |url|
      page.visit url
    end

    step "Record the Heading 4" do
      record_heading_4
    end
    sleep 3
  end

  scenario 'Searching debug', search_debug: true do
    step "User goes to the page", settings('sandbox')['page_h4_test_1'] do |url|
      page.visit url
    end

    step "Check the Heading 4" do
      check_heading_4
    end
    sleep 3
  end

end