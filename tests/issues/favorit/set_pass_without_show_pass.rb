require 'spec_helper'
require_relative '../../pages/es/favorit.rb'
require_relative '../../helpers/special_methods'

include Favorit

feature 'TA-902 Analyzer returns the wrong element (input) in the Sing In section' do

  # Initial locators with Recording

  scenario 'Recording IL', il_run: true do
    step "User goes to the page", settings('favorit')['page'] do |url|
      page.visit url
    end

    step "User clicks on the Sing in button" do
      click_sing_in_button
    end

    step "User set password in Password field", settings('favorit')['pass'] do |pass|
      set_pass_without_show_pass pass
    end

    sleep 3
  end

  scenario 'Searching IL', il_run: true do
    step "User goes to the page", settings('favorit')['page'] do |url|
      page.visit url
    end

    step "User clicks on the Sing in button" do
      check_element_path @sign_in_button_ta, @sign_in_button_il
      click_sing_in_button
    end

    step "User clicks on the Show Pass button" do
      check_element_path @show_pass_button_ta, @show_pass_button_il
      click_show_pass_button
    end

    step "User set password in Password field", settings('favorit')['pass'] do |pass|
      check_element_path @pass_without_show_pass_ta, @pass_il
      set_pass_without_show_pass pass

    end

    sleep 3
  end

  # Element Picker from Repository

  scenario 'Searching EP', ep_run: true do
    step "User goes to the page", settings('favorit')['page'] do |url|
      page.visit url
    end

    step "User clicks on the Sing in button" do
      check_element_path @sign_in_button_ep, @sign_in_button_il
      click_sing_in_button :ep
    end

    step "User clicks on the Show Pass button" do
      check_element_path @show_pass_button_ep, @show_pass_button_il
      click_show_pass_button :ep
    end

    step "User set password in Password field", settings('favorit')['pass'] do |pass|
      check_element_path @pass_without_show_pass_ep, @pass_il
      set_pass_without_show_pass pass, :ep
    end
    sleep 3
  end

  # Debug

  scenario 'Recording debug', rec_debug: true do
    step "User goes to the page", settings('favorit')['page'] do |url|
      page.visit url
    end

    step "User clicks on the Sing in button" do
      click_sing_in_button :il
    end

    step "User set password in Password field", settings('favorit')['pass'] do |pass|
      set_pass_without_show_pass pass
    end

    sleep 3
  end

  scenario 'Searching debug', search_debug: true do
    step "User goes to the page", settings('favorit')['page'] do |url|
      page.visit url
    end

    step "User clicks on the Sing in button" do
      click_sing_in_button :il
    end

    step "User clicks on the Show Pass button" do
      click_show_pass_button :il
    end

    step "User set password in Password field", settings('favorit')['pass'] do |pass|
      set_pass_without_show_pass pass
    end
    sleep 3
  end



end