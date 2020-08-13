require_relative '../page_extension'

class AnimatedDataViewExtJSPage < PageExtension

  HEADER_ANIMATED_DATA_VIEW_IL = "//h1[text()='Animated DataView Example']"
  HEADER_ANIMATED_DATA_VIEW_TA = "sencha:animated_data_view:header_animated_data_view"


  def should_see_header_animated_data_view(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: HEADER_ANIMATED_DATA_VIEW_TA, il: HEADER_ANIMATED_DATA_VIEW_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

end
