require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
require_relative '../../../pages/epicgames'

include ElementSearchValidation

it = Epicgames.new
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end
  feature 'Epicgames - registration on site' do

  # Initial locators with Recording

    scenario 'Recording IL', il: true do

      step "User goes to the page", settings('epicgames')['page'] do |url|
        page.visit url
      end

      step "User clicks on logo button" do
        it.click_logo
      end

      step "User clicks on shop link" do
        it.click_shop_link
      end

      step "User clicks on news link" do
        it.click_news_link
      end

      step "User clicks on help link" do
        it.click_help_link
      end

      step "User clicks on unreal engine link" do
        it.click_unreal_engine_link
      end

      step "User clicks on slider arrow link" do
        it.click_slider_right_link_arrow
      end

      step "User clicks on latest news link" do
        it.click_latest_news
      end

      step "User clicks on sign in link" do
        it.click_sign_in
      end

      step "User clicks on sign up link" do
        it.click_sign_up
      end

      step "User set first name", 'first_name' do  |firstName|
        it.set_first_name(firstName)
      end

      step "User set last name", 'last_name' do  |lastName|
        it.set_last_name(lastName)
      end

      step "User set display name", 'display_name' do |displayName|
        it.set_display_name(displayName)
      end

      step "User set email", 'email' do |email|
        it.set_email(email)
      end

      step "User set password", 'pass' do |password|
        it.set_password(password)
      end

      step "User clicks email subscribe checkbox" do
        it.click_email_subscribe
      end

      step "User clicks terms agree checkbox" do
        it.click_terms_agree
      end

      step "User clicks on registration button" do
        it.click_register_acc
      end

      step "User should see error message" do
        expect(page).to have_selector(:xpath, Epicgames::ROBOT_ERROR)
      end
    end

      scenario 'Searching IL', il: true do

        step "User goes to the page", settings('epicgames')['page'] do |url|
          page.visit url
        end

        step "User clicks on logo button" do
          check_element_path :css, Epicgames::LOGO_TA, Epicgames::LOGO_IL
          it.click_logo
        end

        step "User clicks on shop link" do
          check_element_path :css, Epicgames::SHOP_LINK_IN_HEADER_TA, Epicgames::SHOP_LINK_IN_HEADER_IL
          it.click_shop_link
        end

        step "User clicks on news link" do
          check_element_path :css, Epicgames::NEWS_IN_HEADER_TA, Epicgames::NEWS_IN_HEADER_IL
          it.click_news_link
        end

        step "User clicks on help link" do
          check_element_path :css, Epicgames::HELP_IN_HEADER_TA, Epicgames::HELP_IN_HEADER_IL
          it.click_help_link
        end

        step "User clicks on unreal engine link" do
          check_element_path :css, Epicgames::UNREAL_ENGINE_IN_HEADER_TA, Epicgames::UNREAL_ENGINE_IN_HEADER_IL
          it.click_unreal_engine_link
        end

        step "User clicks on slider arrow link" do
          check_element_path :xpath, Epicgames::SLIDER_RIGHT_ARROW_TA, Epicgames::SLIDER_RIGHT_ARROW_IL
          it.click_slider_right_link_arrow
        end

        step "User clicks on latest news link" do
          check_element_path :css, Epicgames::LATEST_NEWS_TA, Epicgames::LATEST_NEWS_IL
          it.click_latest_news
        end

        step "User clicks on sign in link" do
          check_element_path :xpath, Epicgames::SIGN_IN_TA, Epicgames::SIGN_IN_IL
          it.click_sign_in
        end

        step "User clicks on sign up link" do
          check_element_path :css, Epicgames::SIGN_UP_TA, Epicgames::SIGN_UP_IL
          it.click_sign_up
        end

        step "User set first name", 'first_name' do  |firstName|
          check_element_path :css, Epicgames::FIRST_NAME_TA, Epicgames::FIRST_NAME_IL
          it.set_first_name(firstName)
        end

        step "User set last name", 'last_name' do  |lastName|
          check_element_path :css, Epicgames::LAST_NAME_TA, Epicgames::LAST_NAME_IL
          # - fail
          it.set_last_name(lastName)
        end

        step "User set display name", 'display_name' do |displayName|
          check_element_path :css, Epicgames::DISPLAY_NAME_TA, Epicgames::DISPLAY_NAME_IL
          #- fail
          it.set_display_name(displayName)
        end

        step "User set email", 'email' do |email|
          check_element_path :css, Epicgames::EMAIL_TA, Epicgames::EMAIL_IL
          it.set_email(email)
        end

        step "User set password", 'pass' do |password|
          check_element_path :css, Epicgames::PASSWORD_TA, Epicgames::PASSWORD_IL
          it.set_password(password)
        end

        step "User clicks email subscribe checkbox" do
          check_element_path :css, Epicgames::EMAIL_SUBSCRIBE_TA, Epicgames::EMAIL_SUBSCRIBE_IL
          it.click_email_subscribe
        end

        step "User clicks terms agree checkbox" do
          check_element_path :css, Epicgames::TERMS_AGREE_TA, Epicgames::TERMS_AGREE_IL
          it.click_terms_agree
        end

        step "User clicks on registration button" do
          check_element_path :css, Epicgames::REGISTER_NEW_ACC_TA, Epicgames::REGISTER_NEW_ACC_IL
          it.click_register_acc
        end

        step "User should see error message" do
          expect(page).to have_selector(:xpath, Epicgames::ROBOT_ERROR)
        end
      end

    # Element Picker from Repository

      scenario 'Searching EP', ep: true do

        step "User goes to the page", settings('epicgames')['page'] do |url|
          page.visit url
        end

        step "User clicks on logo button" do
          check_element_path :css, Epicgames::LOGO_EP, Epicgames::LOGO_IL
          it.click_logo :ep
        end

        step "User clicks on shop link" do
          check_element_path :css, Epicgames::SHOP_LINK_IN_HEADER_EP, Epicgames::SHOP_LINK_IN_HEADER_IL
          it.click_shop_link :ep
        end

        step "User clicks on news link" do
          check_element_path :css, Epicgames::NEWS_IN_HEADER_EP, Epicgames::NEWS_IN_HEADER_IL
          it.click_news_link :ep
        end

        step "User clicks on help link" do
          check_element_path :css, Epicgames::HELP_IN_HEADER_EP, Epicgames::HELP_IN_HEADER_IL
          it.click_help_link :ep
        end

        step "User clicks on unreal engine link" do
          check_element_path :css, Epicgames::UNREAL_ENGINE_IN_HEADER_EP, Epicgames::UNREAL_ENGINE_IN_HEADER_IL
          it.click_unreal_engine_link :ep
        end

        step "User clicks on slider arrow link" do
          check_element_path :xpath, Epicgames::SLIDER_RIGHT_ARROW_EP, Epicgames::SLIDER_RIGHT_ARROW_IL
          it.click_slider_right_link_arrow :ep
        end

        step "User clicks on latest news link" do
          check_element_path :css, Epicgames::LATEST_NEWS_EP, Epicgames::LATEST_NEWS_IL
          it.click_latest_news :ep
        end

        step "User clicks on sign in link" do
          check_element_path :xpath, Epicgames::SIGN_IN_EP, Epicgames::SIGN_IN_IL
          it.click_sign_in :ep
        end

        step "User clicks on sign up link" do
          check_element_path :css, Epicgames::SIGN_UP_EP, Epicgames::SIGN_UP_IL
          it.click_sign_up :ep
        end

        step "User set first name", 'first_name' do  |firstName|
          check_element_path :css, Epicgames::FIRST_NAME_EP, Epicgames::FIRST_NAME_IL
          it.set_first_name(:ep,firstName)
        end

        step "User set last name", 'last_name' do  |lastName|
          check_element_path :css, Epicgames::LAST_NAME_EP, Epicgames::LAST_NAME_IL
          it.set_last_name(:ep,lastName)
        end

        step "User set display name", 'display_name' do |displayName|
          check_element_path :css, Epicgames::DISPLAY_NAME_EP, Epicgames::DISPLAY_NAME_IL
          it.set_display_name(:ep,displayName)
        end

        step "User set email", 'email' do |email|
          check_element_path :css, Epicgames::EMAIL_EP, Epicgames::EMAIL_IL
          it.set_email(:ep,email)
        end

        step "User set password", 'pass' do |password|
          check_element_path :css, Epicgames::PASSWORD_EP, Epicgames::PASSWORD_IL
          it.set_password(:ep,password)
        end

        step "User clicks email subscribe checkbox" do
          check_element_path :css, Epicgames::EMAIL_SUBSCRIBE_EP, Epicgames::EMAIL_SUBSCRIBE_IL
          it.click_email_subscribe :ep
        end

        step "User clicks terms agree checkbox" do
          check_element_path :css, Epicgames::TERMS_AGREE_EP, Epicgames::TERMS_AGREE_IL
          it.click_terms_agree :ep
        end

        step "User clicks on registration button" do
          check_element_path :css, Epicgames::REGISTER_NEW_ACC_EP, Epicgames::REGISTER_NEW_ACC_IL
          it.click_register_acc :ep
        end

        step "User should see error message" do
          expect(page).to have_selector(:xpath, Epicgames::ROBOT_ERROR)
        end
      end
    end
  end
