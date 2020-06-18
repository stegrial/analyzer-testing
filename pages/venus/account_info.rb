require 'spec_helper'
require_relative '../page_extension'

class VenusAccount < PageExtension

  ACCOUNT_INFO_BUTTON_IL = "a[href*='accountinformation']"
  ACCOUNT_INFO_BUTTON_TA = 'venus:account_page:account_info_button'


  def fill_first_name_field(key = nil, first_name)
    find_element(key, il_type: :css, tl: SEARCH_FIELD_TA, il: SEARCH_FIELD_IL, check_path: $check_path).fill_in first_name
  end

end
