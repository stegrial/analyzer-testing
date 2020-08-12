require_relative '../page_extension'

class MultiSelectAndItemSelectorExtJSPage < PageExtension

  HEADER_MULTI_SELECT_AND_ITEM_SELECTOR_IL = "//h1[text()='MultiSelect & ItemSelector']"
  HEADER_MULTI_SELECT_AND_ITEM_SELECTOR_TA = "sencha:multi_select_and_item_selector:header_multi_select_and_item_selector"


  def should_see_header_multi_select_and_item_selector(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: HEADER_MULTI_SELECT_AND_ITEM_SELECTOR_TA, il: HEADER_MULTI_SELECT_AND_ITEM_SELECTOR_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

end
