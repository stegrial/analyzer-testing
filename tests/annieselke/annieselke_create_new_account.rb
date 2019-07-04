require 'spec_helper'
require_relative '../../pages/annieselke.rb'
require_relative '../../helpers/special_methods'
require_relative '../../pages/united_methods'

include PathCheck
include AnnieSelke

feature 'Analyzer returns the wrong element (link) in the Offer of month section' do

  # Initial locators with Recording

  scenario 'Recording IL', il_run: true do

    step "User goes to the page", settings('annieselke')['page'] do |url|
      page.visit url
    end

    # User clicks on close button for close modal
    close_modal

    step "User clicks on login button" do
      login_btn
    end

    step "User clicks for create new acc" do
      create_acc
    end

    step "User set first name" do
      set_any_first_name
    end

    step "User set last name" do
      set_any_last_name
    end

    step "User set email" do
      set_any_email
    end

    step "User set password" do
      set_any_pass
    end

    step "User check password" do
      check_any_pass
    end

    step "User clicks on subscribe button" do
      click_subscribe
    end

    step "User clicks on register button" do
      click_register_btn
    end

  end

  scenario 'Searching IL', il_run: true do

    step "User goes to the page", settings('annieselke')['page'] do |url|
      page.visit url
    end

    # User clicks on close button for close modal
    close_modal

    step "User clicks on login button" do
      check_element_path @login_btn_ta, @login_btn_il
      login_btn
    end

    step "User clicks for create new acc" do
      check_element_path @create_acc_ta, @create_acc_il
      create_acc
    end

    step "User set first name" do
      check_element_path @first_name_ta, @first_name_il
      set_any_first_name
    end

    step "User set last name" do
      check_element_path @last_name_ta, @last_name_il
      set_any_last_name
    end

    step "User set email" do
      check_element_path @email_ta, @email_il
      set_any_email
    end

    step "User set password" do
      check_element_path @pass_ta, @pass_il
      set_any_pass
    end

    step "User check password" do
      check_element_path @check_pwd_ta, @check_pwd_il
      check_any_pass
    end

    step "User clicks on subscribe button" do
      check_element_path @subscribe_ta, @subscribe_il
      click_subscribe
    end

    step "User clicks on register button" do
      check_element_path @register_ta, @register_il
      click_register_btn
    end

  end

  # Element Picker from Repository

  scenario 'Searching EP', ep_run: true do

    step "User goes to the page", settings('annieselke')['page'] do |url|
      page.visit url
    end

    # User clicks on close button for close modal
    close_modal

    step "User clicks on login button" do
      check_element_path @login_btn_ep, @login_btn_il
      login_btn true
    end

    step "User clicks for create new acc" do
      check_element_path @create_acc_ep, @create_acc_il
      create_acc true
    end

    step "User set first name" do
      check_element_path @first_name_ep, @first_name_il
      set_any_first_name true
    end

    step "User set last name" do
      check_element_path @last_name_ep, @last_name_il
      set_any_last_name true
    end

    step "User set email" do
      check_element_path @email_ep, @email_il
      set_any_email true
    end

    step "User set password" do
      check_element_path @pass_ep, @pass_il
      set_any_pass true
    end

    step "User check password" do
      check_element_path @check_pwd_ep, @check_pwd_il
      check_any_pass true
    end

    step "User clicks on subscribe button" do
      check_element_path @subscribe_ep, @subscribe_il
      click_subscribe true
    end

    step "User clicks on register button" do
      check_element_path @register_ep, @register_il
      click_register_btn true
    end
  end

  # Debug

  scenario 'Recording debug', rec_debug: true do

    step "User goes to the page", settings('annieselke')['page'] do |url|
      page.visit url
    end

    # User clicks on close button for close modal
    close_modal

    step "User clicks on login button" do
      login_btn
    end

    step "User clicks for create new acc" do
      create_acc
    end

    step "User set first name" do
      set_any_first_name
    end

    step "User set last name" do
      set_any_last_name
    end

    step "User set email" do
      set_any_email
    end

    step "User set password" do
      set_any_pass
    end

    step "User check password" do
      check_any_pass
    end

    step "User clicks on subscribe button" do
      click_subscribe
    end

    step "User clicks on register button" do
      click_register_btn
    end
  end

  scenario 'Searching debug', search_debug: true do

    step "User goes to the page", settings('annieselke')['page'] do |url|
      page.visit url
    end

    # User clicks on close button for close modal
    close_modal

    step "User clicks on login button" do
      login_btn
    end

    step "User clicks for create new acc" do
      create_acc
    end

    step "User set first name" do
      set_any_first_name
    end

    step "User set last name" do
      set_any_last_name
    end

    step "User set email" do
      set_any_email
    end

    step "User set password" do
      set_any_pass
    end

    step "User check password" do
      check_any_pass
    end

    step "User clicks on subscribe button" do
      click_subscribe
    end

    step "User clicks on register button" do
      click_register_btn
    end
  end
end
