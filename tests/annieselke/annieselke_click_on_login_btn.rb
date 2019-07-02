require 'spec_helper'
require_relative '../../pages/annieselke.rb'
require_relative '../../helpers/special_methods'

include AnnieSelke

feature 'Analyzer returns the wrong element (link) in the Offer of month section' do

  # Initial locators with Recording

  scenario 'Recording IL', il_run: true do

    step "User goes to the page", settings('annieselke')['page'] do |url|
      page.visit url
    end
    sleep 200

    if page.has_xpath?("//iframe[@title='Sign up for 15% Off!']")
      within_frame(1) do
        find(:xpath, "//button[@title='Close Dialog']").click
      end
    end

    step "User clicks on login button" do
      login_btn
    end

    Capybara.current_session.driver.quit

  end

  scenario 'Searching IL', il_run: true do

    step "User goes to the page", settings('annieselke')['page'] do |url|
      page.visit url
    end
    if page.has_xpath?("//iframe[@title='Sign up for 15% Off!']")
      within_frame(1) do
        find(:xpath, "//button[@title='Close Dialog']").click
      end
    end

    step "User clicks on login button" do
      login_btn
      check_element_path @login_btn_ta, @login_btn_il
    end


    Capybara.current_session.driver.quit

  end

  # Element Picker from Repository

  scenario 'Searching EP', ep_run: true do

    step "User goes to the page", settings('annieselke')['page'] do |url|
      page.visit url
    end

    step "User clicks on close button for close modal" do
      within_frame(1) do
        page.execute_script("document.querySelector('button.close').click()")
      end
    end

    step "User clicks on login button" do
      ep_login_btn
    end


  end

  # Debug

  scenario 'Recording debug', rec_debug: true do

    step "User goes to the page", settings('annieselke')['page'] do |url|
      page.visit url
    end

    if page.has_xpath?("//iframe[@title='Sign up for 15% Off!']")
      within_frame(1) do
        find(:xpath, "//button[@title='Close Dialog']").click
      end
    end

    step "User clicks on login button" do
      login_btn
    end

  end

  scenario 'Searching debug', search_debug: true do

    step "User goes to the page", settings('annieselke')['page'] do |url|
      page.visit url
    end

    if page.has_xpath?("//iframe[@title='Sign up for 15% Off!']")
      within_frame(1) do
        find(:xpath, "//button[@title='Close Dialog']").click
      end
    end

    step "User clicks on login button" do
      login_btn
    end

  end
end
