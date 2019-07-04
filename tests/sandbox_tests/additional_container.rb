require 'spec_helper'
require_relative '../../pages/sandbox_tests'
require_relative '../../helpers/special_methods'

include SandboxTests

feature 'TA-148 TA finds the wrong element, if the element was added into additional container' do

  # Initial locators with Recording

  scenario 'Recording IL', il_run: true do
    step "User goes to the page", settings('sandbox')['withXpath'] do |url|
      page.visit url
    end

    step "Record the Heading 2 - Video" do
      record_h2_video
    end
    sleep 3
  end

  scenario 'Searching IL', il_run: true do
    step "User goes to the page", settings('sandbox')['addedContainerXpath'] do |url|
      page.visit url
    end

    step "Check the Heading 2 - Video" do
      check_h2_video
    end
    sleep 3
  end

  # Debug

  scenario 'Recording debug', rec_debug: true do
    step "User goes to the page", settings('sandbox')['withXpath'] do |url|
      page.visit url
    end

    step "Record the Heading 2 - Video" do
      record_h2_video
    end
    sleep 3
  end

  scenario 'Searching debug', search_debug: true do
    step "User goes to the page", settings('sandbox')['addedContainerXpath'] do |url|
      page.visit url
    end

    step "Check the Heading 2 - Video" do
      check_h2_video
    end
    sleep 3
  end

end