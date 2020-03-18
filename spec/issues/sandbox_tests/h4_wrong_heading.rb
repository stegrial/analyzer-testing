require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
require_relative '../../../pages/sandbox_tests'

include ElementSearchValidation

it = SandboxTests.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'TA-152 TA ignores the attributes of intermediate elements in the DOM tree and finds a wrong elements' do

  # Initial locators with Recording

  scenario 'Recording IL', il: true do
    step "User goes to the page", settings('sandbox')['page_h4'] do |url|
      page.visit url
    end

    step "Record the Heading 4 " do
      it.record_heading_4
    end
    sleep 3
  end

  scenario 'Searching IL', il: true do
    step "User goes to the page", settings('sandbox')['page_h4_test_1'] do |url|
      page.visit url
    end

    step "Check the Heading 4" do
      check_element_path :xpath, SandboxTests::SECOND_HEADING_TA, SandboxTests::SECOND_HEADING_IL
    end
    sleep 3
  end

  # Debug

  scenario 'Recording debug', rec_debug: true do
    step "User goes to the page", settings('sandbox')['page_h4'] do |url|
      page.visit url
    end

    step "Record the Heading 4" do
      it.record_heading_4
    end
    sleep 3
  end

  scenario 'Searching debug', search_debug: true do
    step "User goes to the page", settings('sandbox')['page_h4_test_1'] do |url|
      page.visit url
    end

    step "Check the Heading 4" do
      check_element_path :xpath, SandboxTests::SECOND_HEADING_TA, SandboxTests::SECOND_HEADING_IL
    end
    sleep 3
  end

end

end