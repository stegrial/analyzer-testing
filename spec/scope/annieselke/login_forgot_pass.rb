require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

login_page = LoginPage.new
forgotten_pass_page = ForgottenPassPage.new
banner_page = BannerPage.new
header_page = HeaderPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Password recovery' do

    # Initial locators with Recording
    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('annieselke')['page'] do |url|
          page.visit url
          banner_page.close_banner
        end

        step "User clicks login link on home page" do
          header_page.click_login_link
        end

        step "User clicks Oops! I forgot my password." do
          login_page.click_forgot_pass_link
        end

        step "User fills email", settings('annieselke')['email'] do |email|
          login_page.fill_email_input(email)
        end

        step "User clicks Send email button" do
          forgotten_pass_page.click_send_email_btn
        end

        step "User clicks Return to login button" do
          forgotten_pass_page.click_return_login_btn
        end
      end
    end
  end
end
