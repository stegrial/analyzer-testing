require_relative '../page_extension'

class CloudBeesUsers < PageExtension

  CREATE_USER_BTN_IL = "//td[@id='pageHeader_actionList_actionList0']/a"
  CREATE_USER_BTN_TA = 'cloud_bees:users:create_user_btn'

  USER_FILTER_FIELD_IL = '[id=filter]'
  USER_FILTER_FIELD_TA = 'cloud_bees:users:user_filter_fld'

  APPLY_USER_FILTER_IL = '[id=submitButton]'
  APPLY_USER_FILTER_TA = 'cloud_bees:users:apply_user_filter_btn'

  EDIT_USER_BTN_IL = '.edit-icon'
  EDIT_USER_BTN_TA = 'cloud_bees:users:edit_user_btn'

  DELETE_USER_BTN_IL = '.delete-icon'
  DELETE_USER_BTN_TA = 'cloud_bees:users:delete_user_btn'

  CONFIRM_USER_DELETION_BTN_IL = "//div[@id='jsDialogWindow']//input[@value='OK']"
  CONFIRM_USER_DELETION_BTN_TA = 'cloud_bees:users:delete_user_popup:confirm_btn'

  def press_create_user_btn(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: CREATE_USER_BTN_TA, il: CREATE_USER_BTN_IL).click
    end
  end

  def fill_user_filter_field(key = nil, name)
    within_frame(0) do
      find_element(key, il_type: :css, tl: USER_FILTER_FIELD_TA, il: USER_FILTER_FIELD_IL).set(name)
    end
  end

  def apply_user_filter(key = nil)
    within_frame(0) do
      find_element(key, il_type: :css, tl: APPLY_USER_FILTER_TA, il: APPLY_USER_FILTER_IL).click
    end
  end

  def press_edit_user_btn(key = nil)
    within_frame(0) do
      find_element(key, il_type: :css, tl: EDIT_USER_BTN_TA, il: EDIT_USER_BTN_IL).click
    end
  end

  def press_delete_user_btn(key = nil)
    within_frame(0) do
      find_element(key, il_type: :css, tl: DELETE_USER_BTN_TA, il: DELETE_USER_BTN_IL).click
    end
  end

  def confirm_user_deletion(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: CONFIRM_USER_DELETION_BTN_TA, il: CONFIRM_USER_DELETION_BTN_IL).click
    end
  end


end