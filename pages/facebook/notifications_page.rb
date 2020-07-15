require_relative '../page_extension'

class NotificationsPageFacebook < PageExtension


  YOUR_NOTIFICATIONS_IL = "//h2[contains(text(), 'Your Notifications')and @class='uiHeaderTitle'][1]"
  YOUR_NOTIFICATIONS_TA = "facebook:notifications_page:your_notifications_h2"

  NOTIFICATIONS_SETTINGS_IL = "//a[contains(text(), 'Notification Settings')]"
  NOTIFICATIONS_SETTINGS_TA = "facebook:notifications_page:notifications_settings"

  WHAT_NOTIFICATIONS_RECEIVE_IL = "//div[contains(text(), 'What Notifications You Receive')]"
  WHAT_NOTIFICATIONS_RECEIVE_TA = "facebook:notifications_page:what_notifications_receive"

  REMINDERS_IL = "//div[contains(text(), 'Reminders')]"
  REMINDERS_TA = "facebook:notifications_page:reminders_link"

  NOTIFICATIONS_REMIND_UPDATE_IL = "//div[contains(text(), 'notifications to remind you of updates')]"
  NOTIFICATIONS_REMIND_UPDATE_TA = "facebook:notifications_page:notifications_remind_updates"

  SMS_SWITCH_IL = "(//input[contains(@role, 'switch')])[4]"
  SMS_SWITCH_TA = "facebook:notifications_page:sms_switch_toggle"

  def should_see_your_notifications_h2(key = nil)
    element = find_element(key, il_type: :xpath, tl: YOUR_NOTIFICATIONS_TA, il: YOUR_NOTIFICATIONS_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_notifications_settings(key = nil)
    find_element(key, il_type: :xpath, tl: NOTIFICATIONS_SETTINGS_TA, il: NOTIFICATIONS_SETTINGS_IL, check_path: $check_path).click
  end

  def should_see_what_notifications_receive(key = nil)
    element = find_element(key, il_type: :xpath, tl: WHAT_NOTIFICATIONS_RECEIVE_TA, il: WHAT_NOTIFICATIONS_RECEIVE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_reminders_link(key = nil)
    find_element(key, il_type: :xpath, tl: REMINDERS_TA, il: REMINDERS_IL, check_path: $check_path).click
  end

  def should_see_notifications_remind_updates(key = nil)
    element = find_element(key, il_type: :xpath, tl: NOTIFICATIONS_REMIND_UPDATE_TA, il: NOTIFICATIONS_REMIND_UPDATE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_sms_switch_toggle(key = nil)
    find_element(key, il_type: :xpath, tl: SMS_SWITCH_TA, il: SMS_SWITCH_IL, check_path: $check_path).click
  end

end