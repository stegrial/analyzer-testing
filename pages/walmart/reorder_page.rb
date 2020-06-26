require_relative '../page_extension'

class ReorderPageWalmart < PageExtension


  QUICKLY_REORDER_H2_IL = "//h2[text()='Quickly reorder your essentials']"
  QUICKLY_REORDER_H2_TA = "walmart:reorder_page:quickly_reorder_text"


  def should_see_quickly_reorder_h2(key = nil)
    element = find_element(key, il_type: :xpath, tl: QUICKLY_REORDER_H2_TA, il: QUICKLY_REORDER_H2_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end