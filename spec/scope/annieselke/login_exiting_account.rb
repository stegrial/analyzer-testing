require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/annieselke/*.rb"

login_page = LoginPage.new
banner_page = BannerPage.new
header_page = HeaderPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Login via existing account' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('annieselke')['page'] do |url|
          page.visit url
          banner_page.close_banner
        end

        step "User clicks login link on home page" do
          header_page.click_login_link
        end

        step "User fills email", settings('annieselke')['email'] do |email|
          banner_page.close_banner
          login_page.fill_email_input(email)
        end

        step "User fills pass", settings('annieselke')['pass'] do |pass|
          login_page.fill_pass_input(pass)
        end

        step "User clicks login button" do
          login_page.click_login_btn
        end

        sleep 3
      end
    end

  end
end
