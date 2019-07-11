require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/annieselke'

it = Annieselke.new

feature 'Annie Selke - creating new account' do

  # Initial locators with Recording

  scenario 'Recording IL', il_run: true do

    step "User goes to the page", settings('annieselke')['page'] do |url|
      page.visit url
    end

    # User clicks on close button for close modal
    close_modal

    step "User clicks on login button" do
      it.login_btn
    end

    step "User clicks for create new acc" do
      it.create_acc
    end

    step "User set first name" do
      it.set_any_first_name
    end

    step "User set last name" do
      it.set_any_last_name
    end

    step "User set email" do
      it.set_any_email
    end

    step "User set password" do
      it.set_any_pass
    end

    step "User check password" do
      it.check_any_pass
    end

    step "User clicks on subscribe button" do
      it. click_subscribe
    end

    step "User clicks on register button" do
      it.click_register_btn
    end

  end

  scenario 'Searching IL', il_run: true do

    step "User goes to the page", settings('annieselke')['page'] do |url|
      page.visit url
    end

    # User clicks on close button for close modal
    close_modal

    step "User clicks on login button" do
      check_element_path :xpath, Annieselke::LOGIN_BTN_TA, Annieselke::LOGIN_BTN_IL
      it.login_btn
    end

    step "User clicks for create new acc" do
      check_element_path :xpath, Annieselke::CREATE_ACC_TA, Annieselke::CREATE_ACC_IL
      it.create_acc
    end

    step "User set first name" do
      check_element_path :xpath, Annieselke::FIRST_NAME_TA, Annieselke::FIRST_NAME_IL
      it.set_any_first_name
    end

    step "User set last name" do
      check_element_path :xpath, Annieselke::LAST_NAME_TA, Annieselke::LAST_NAME_IL
      it.set_any_last_name
    end

    step "User set email" do
      check_element_path :xpath, Annieselke::EMAIL_TA, Annieselke::EMAIL_IL
      it.set_any_email
    end

    step "User set password" do
      check_element_path :xpath, Annieselke::PASS_TA, Annieselke::PASS_IL
      it.set_any_pass
    end

    step "User check password" do
      check_element_path :xpath, Annieselke::CHECK_PWD_TA, Annieselke::CHECK_PWD_IL
      it.check_any_pass
    end

    step "User clicks on subscribe button" do
      check_element_path :xpath, Annieselke::SUBSCRIBE_TA, Annieselke::SUBSCRIBE_IL
      it.click_subscribe
    end

    step "User clicks on register button" do
      check_element_path :xpath, Annieselke::REGISTER_TA, Annieselke::REGISTER_IL
      it.click_register_btn
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
      check_element_path :xpath, Annieselke::LOGIN_BTN_EP, Annieselke::LOGIN_BTN_Il
      it.login_btn :ep
    end

    step "User clicks for create new acc" do
      check_element_path :xpath, Annieselke::CREATE_ACC_EP, Annieselke::CREATE_ACC_IL
      it.create_acc :ep
    end

    step "User set first name" do
      check_element_path :xpath, Annieselke::FIRST_NAME_EP, Annieselke::FIRST_NAME_IL
      it.set_any_first_name :ep
    end

    step "User set last name" do
      check_element_path :xpath, Annieselke::LAST_NAME_EP, Annieselke::LAST_NAME_IL
      it.set_any_last_name :ep
    end

    step "User set email" do
      check_element_path :xpath, Annieselke::EMAIL_EP, Annieselke::EMAIL_IL
      it.set_any_email :ep
    end

    step "User set password" do
      check_element_path :xpath, Annieselke::PASS_EP, Annieselke::PASS_IL
      it.set_any_pass :ep
    end

    step "User check password" do
      check_element_path :xpath, Annieselke::CHECK_PWD_EP, Annieselke::CHECK_PWD_IL
      it.check_any_pass :ep
    end

    step "User clicks on subscribe button" do
      check_element_path :xpath, Annieselke::SUBSCRIBE_EP, Annieselke::SUBSCRIBE_IL
      it.click_subscribe :ep
    end

    step "User clicks on register button" do
      check_element_path :xpath, Annieselke::REGISTER_EP, Annieselke::REGISTER_IL
      it.click_register_btn :ep
    end
  end
end
