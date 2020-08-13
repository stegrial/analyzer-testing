require_relative '../page_extension'

class CustomDragAndDropExtJSPage < PageExtension

  HEADER_CUSTOM_DRAG_AND_DROP_IL = "//h1[text()='Patient Hospital Assignment']"
  HEADER_CUSTOM_DRAG_AND_DROP_TA = "sencha:custom_drag_and_drop:header_custom_drag_and_drop"


  def should_see_header_custom_drag_and_drop(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: HEADER_CUSTOM_DRAG_AND_DROP_TA, il: HEADER_CUSTOM_DRAG_AND_DROP_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

end
