require_relative '../page_extension'

class GridWithBufferedStoreExtJSPage < PageExtension

  HEADER_GRID_WITH_BUFFERED_STORE_IL = "//h1[text()='Grid with Buffered Store']"
  HEADER_GRID_WITH_BUFFERED_STORE_TA = "sencha:grid_with_buffered_store:header_grid_with_buffered_store"


  def should_see_header_grid_with_buffered_store(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: HEADER_GRID_WITH_BUFFERED_STORE_TA, il: HEADER_GRID_WITH_BUFFERED_STORE_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

end
