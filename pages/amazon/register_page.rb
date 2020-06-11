require_relative '../page_extension'

class RegisterPage < PageExtension


  REGISTER_PAGE_IL = "//h3[contains(text(),'Registry discounts, rewards and bonus gifts')]"
  REGISTER_PAGE_TA = "amazon:register_page:register_page"


  def should_see_register_page(key = nil)
    element = find_element(key, il_type: :xpath, tl: REGISTER_PAGE_TA, il: REGISTER_PAGE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
