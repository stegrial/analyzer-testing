require_relative '../page_extension'

class KitchenSinkClassicExtJSPage < PageExtension

  HEADER_KITCHEN_SINK_CLASSIC_IL = "//div[text()='Ext JS Kitchen Sink']"
  HEADER_KITCHEN_SINK_CLASSIC_TA = "sencha:kitchen_sink_classic:header_kitchen_sink_classic"


  def should_see_header_kitchen_sink_classic(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: HEADER_KITCHEN_SINK_CLASSIC_TA, il: HEADER_KITCHEN_SINK_CLASSIC_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

end
