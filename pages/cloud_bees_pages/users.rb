require 'spec_helper'
require_relative '../../helpers/special_methods'

class CloudBeesUsers
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include ExtendPage

  CREATE_USER_BTN_IL = "//td[@id='pageHeader_actionList_actionList0']/a"
  CREATE_USER_BTN_TA = 'cloud_bees:users:create_user_btn'
  CREATE_USER_BTN_EP = 'EP:cloud_bees:users:create_user_btn'

  USER_FILTER_FIELD_IL = '[id=filter]'
  USER_FILTER_FIELD_TA = 'cloud_bees:users:user_filter_fld'
  USER_FILTER_FIELD_EP = 'EP:cloud_bees:users:user_filter_fld'

  APPLY_USER_FILTER_IL = '[id=submitButton]'
  APPLY_USER_FILTER_TA = 'cloud_bees:users:apply_user_filter_btn'
  APPLY_USER_FILTER_EP = 'EP:cloud_bees:users:apply_user_filter_btn'

  EDIT_USER_BTN_IL = '.edit-icon'
  EDIT_USER_BTN_TA = 'cloud_bees:users:edit_user_btn'
  EDIT_USER_BTN_EP = 'EP:cloud_bees:users:edit_user_btn'

  DELETE_USER_BTN_IL = '.delete-icon'
  DELETE_USER_BTN_TA = 'cloud_bees:users:delete_user_btn'
  DELETE_USER_BTN_EP = 'EP:cloud_bees:users:delete_user_btn'

  CONFIRM_USER_DELETION_BTN_IL = "//div[@id='jsDialogWindow']//input[@value='OK']"
  CONFIRM_USER_DELETION_BTN_TA = 'cloud_bees:users:delete_user_popup:confirm_btn'
  CONFIRM_USER_DELETION_BTN_EP = 'EP:cloud_bees:users:delete_user_popup:confirm_btn'

  def press_create_user_btn(key = nil)
    post_processing key do
      within_frame(0) do
        return find(ta(CREATE_USER_BTN_EP)).click if key == :ep
        return find(:xpath, CREATE_USER_BTN_IL).click if key == :il
        find(:xpath, ta(CREATE_USER_BTN_TA, CREATE_USER_BTN_IL)).click
      end
    end
  end

  def fill_user_filter_field(key = nil, name)
    post_processing key do
      within_frame(0) do
        return find(ta(USER_FILTER_FIELD_EP)).set(name) if key == :ep
        return find(:css, USER_FILTER_FIELD_IL).set(name) if key == :il
        find(:css, ta(USER_FILTER_FIELD_TA, USER_FILTER_FIELD_IL)).set(name)
      end
    end
  end

  def apply_user_filter(key = nil)
    post_processing key do
      within_frame(0) do
        return find(ta(APPLY_USER_FILTER_EP)).click if key == :ep
        return find(:css, APPLY_USER_FILTER_IL).click if key == :il
        find(:css, ta(APPLY_USER_FILTER_TA, APPLY_USER_FILTER_IL)).click
      end
    end
  end

  def press_edit_user_btn(key = nil)
    post_processing key do
      within_frame(0) do
        return find(ta(EDIT_USER_BTN_EP)).click if key == :ep
        return find(:css, EDIT_USER_BTN_IL).click if key == :il
        find(:css, ta(EDIT_USER_BTN_TA, EDIT_USER_BTN_IL)).click
      end
    end
  end

  def press_delete_user_btn(key = nil)
    post_processing key do
      within_frame(0) do
        return find(ta(DELETE_USER_BTN_EP)).click if key == :ep
        return find(:css, DELETE_USER_BTN_IL).click if key == :il
        find(:css, ta(DELETE_USER_BTN_TA, DELETE_USER_BTN_IL)).click
      end
    end
  end

  def confirm_user_deletion(key = nil)
    post_processing key do
      within_frame(0) do
        return find(ta(CONFIRM_USER_DELETION_BTN_EP)).click if key == :ep
        return find(:xpath, CONFIRM_USER_DELETION_BTN_IL).click if key == :il
        find(:xpath, ta(CONFIRM_USER_DELETION_BTN_TA, CONFIRM_USER_DELETION_BTN_IL)).click
      end
    end
  end


end