require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/venus'

it = Venus.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'TA-999, TA Analyzer returns a wrong element path after text of the element was changed (Venus - Product Size information)' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('venus')['login_page'] do |url|
        page.visit url
      end

      step "User fills the Email field", settings('venus')['email'] do |email|
        it.fill_email_field email
      end

      step "User fills the Pass field", settings('venus')['pass'] do |pass|
        it.fill_pass_field pass
      end

      step "User clicks on the Sign In button" do
        it.click_sign_in_button
      end

      step "User clicks on the Sale category" do
        it.click_sale_cat
      end

      step "User opens dropdown in the Sale category" do
        it.open_cat_dropdown
        sleep 2 # need to wait loading the dropdown with subcategories
      end

      step "User chooses the subcategory in the dropdown",'Clothing Sale', 'Tops' do |*name|
        it.choose_subcat_by_first_name name
      end

      step "User chooses a product by name in the list", 'love print top' do |name|
        it.choose_product_by_name name
      end

      step "User chooses a size in the list", 'L' do |size|
        it.choose_list_size size
      end

      step "User chooses a size in the list", 'M' do |size|
        it.choose_list_size size
      end

      step "User opens dropdown to select the quantity of product" do
        it.open_qty_dropdown
      end

      step "User selects the quantity of product", '2' do |qty|
        it.select_quantity qty
      end

      step "User clicks on the + Wish List button" do
        it.click_wish_list_button
      end

      step "User observes the product size" do
        it.observe_product_size
      end

      step "User clears the Wish List" do
        it.click_remove_wish_list
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", settings('venus')['login_page'] do |url|
        page.visit url
      end

      step "User fills the Email field", settings('venus')['email'] do |email|
        check_element_path :id, Venus::EMAIL_FIELD_TA, Venus::EMAIL_FIELD_IL
        it.fill_email_field email
      end

      step "User fills the Pass field", settings('venus')['pass'] do |pass|
        check_element_path :id, Venus::PASS_FIELD_TA, Venus::PASS_FIELD_IL
        it.fill_pass_field pass
      end

      step "User clicks on the Sign In button" do
        check_element_path :id, Venus::SIGN_IN_BTN_TA, Venus::SIGN_IN_BTN_IL
        it.click_sign_in_button
      end

      step "User clicks on the Sale category" do
        check_element_path :xpath, Venus::SALE_CAT_TA, Venus::SALE_CAT_IL
        it.click_sale_cat
      end

      step "User opens dropdown in the Sale category" do
        check_element_path :xpath, Venus::CAT_DROPDOWN_TA, Venus::CAT_DROPDOWN_IL
        it.open_cat_dropdown
        sleep 2 # need to wait loading the dropdown with subcategories
      end

      step "User chooses the subcategory in the dropdown",'Clothing Sale', 'Tops' do |*name|
        check_element_path :xpath, it.subcat_name(:ta, name), it.subcat_name(:il, name)
        it.choose_subcat_by_first_name name
      end

      step "User chooses a product by name in the list", 'love print top' do |name|
        check_element_path :xpath, it.product_name(:ta, name), it.product_name(:il, name)
        it.choose_product_by_name name
      end

      step "User chooses a size in the list", 'M' do |size|
        check_element_path :xpath, it.list_size(:ta, size), it.list_size(:il, size)
        it.choose_list_size size
      end

      step "User chooses a size in the list", 'L' do |size|
        check_element_path :xpath, it.list_size(:ta, size), it.list_size(:il, size)
        it.choose_list_size size
      end

      step "User opens dropdown to select the quantity of product" do
        check_element_path :xpath, Venus::QTY_DROPDOWN_TA, Venus::QTY_DROPDOWN_IL
        it.open_qty_dropdown
      end

      step "User selects the quantity of product", '2' do |qty|
        check_element_path :xpath, it.quantity(:ta, qty), it.quantity(:il, qty)
        it.select_quantity qty
      end

      step "User clicks on the + Wish List button" do
        check_element_path :xpath, Venus::WISH_LIST_BTN_TA, Venus::WISH_LIST_BTN_IL
        it.click_wish_list_button
      end

      step "User observes the product size" do
        check_element_path :xpath, Venus::PRODUCT_SIZE_TA, Venus::PRODUCT_SIZE_IL
        it.observe_product_size
      end

      step "User clears the Wish List" do
        check_element_path :xpath, Venus::REMOVE_WISH_LIST_BTN_TA, Venus::REMOVE_WISH_LIST_BTN_IL
        it.click_remove_wish_list
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page", settings('venus')['login_page'] do |url|
        page.visit url
      end

      step "User fills the Email field", settings('venus')['email'] do |email|
        check_element_path :id, Venus::EMAIL_FIELD_EP, Venus::EMAIL_FIELD_IL
        it.fill_email_field :ep, email
      end

      step "User fills the Pass field", settings('venus')['pass'] do |pass|
        check_element_path :id, Venus::PASS_FIELD_EP, Venus::PASS_FIELD_IL
        it.fill_pass_field :ep, pass
      end

      step "User clicks on the Sign In button" do
        check_element_path :id, Venus::SIGN_IN_BTN_EP, Venus::SIGN_IN_BTN_IL
        it.click_sign_in_button :ep
      end

      step "User clicks on the Sale category" do
        check_element_path :xpath, Venus::SALE_CAT_EP, Venus::SALE_CAT_IL
        it.click_sale_cat :ep
      end

      step "User opens dropdown in the Sale category" do
        check_element_path :xpath, Venus::CAT_DROPDOWN_EP, Venus::CAT_DROPDOWN_IL
        it.open_cat_dropdown :ep
        sleep 2 # need to wait loading the dropdown with subcategories
      end

      step "User chooses the subcategory in the dropdown",'Clothing Sale', 'Tops' do |*name|
        check_element_path :xpath, it.subcat_name(:ep, name), it.subcat_name(:il, name)
        it.choose_subcat_by_first_name :ep, name
      end

      step "User chooses a product by name in the list", 'love print top' do |name|
        check_element_path :xpath, it.product_name(:ep, name), it.product_name(:il, name)
        it.choose_product_by_name name
      end

      step "User chooses a size in the list", 'M' do |size|
        check_element_path :xpath, it.list_size(:ep, size), it.list_size(:il, size)
        it.choose_list_size :ep, size
      end

      step "User chooses a size in the list", 'L' do |size|
        check_element_path :xpath, it.list_size(:ep, size), it.list_size(:il, size)
        it.choose_list_size :ep, size
      end

      step "User opens dropdown to select the quantity of product" do
        check_element_path :xpath, Venus::QTY_DROPDOWN_EP, Venus::QTY_DROPDOWN_IL
        it.open_qty_dropdown :ep
      end

      step "User selects the quantity of product", '2' do |qty|
        check_element_path :xpath, it.quantity(:ep, qty), it.quantity(:il, qty)
        it.select_quantity :ep, qty
      end

      step "User clicks on the + Wish List button" do
        check_element_path :xpath, Venus::WISH_LIST_BTN_EP, Venus::WISH_LIST_BTN_IL
        it.click_wish_list_button :ep
      end

      step "User observes the product size" do
        check_element_path :xpath, Venus::PRODUCT_SIZE_EP, Venus::PRODUCT_SIZE_IL
        it.observe_product_size :ep
      end

      step "User clears the Wish List" do
        check_element_path :xpath, Venus::REMOVE_WISH_LIST_BTN_EP, Venus::REMOVE_WISH_LIST_BTN_IL
        it.click_remove_wish_list :ep
      end

      sleep 3
    end

    # Debug

    scenario 'Recording debug', rec_debug: true do
      step "User goes to the page", settings('venus')['login_page'] do |url|
        page.visit url
      end

      step "User fills the Email field", settings('venus')['email'] do |email|
        it.fill_email_field :il, email
      end

      step "User fills the Pass field", settings('venus')['pass'] do |pass|
        it.fill_pass_field :il, pass
      end

      step "User clicks on the Sign In button" do
        it.click_sign_in_button :il
      end

      step "User clicks on the Sale category" do
        it.click_sale_cat :il
      end

      step "User opens dropdown in the Sale category" do
        it.open_cat_dropdown :il
        sleep 2 # need to wait loading the dropdown with subcategories
      end

      step "User chooses the subcategory in the dropdown",'Clothing Sale', 'Tops' do |*name|
        it.choose_subcat_by_first_name :il, name
      end

      step "User chooses a product by name in the list", 'love print top' do |name|
        it.choose_product_by_name name
      end
=begin can't reproduce: TA-999 (new issue)
      step "User chooses a size in the list", 'L' do |size|
        it.choose_list_size :il, size
      end

      step "User chooses a size in the list", 'M' do |size|
        it.choose_list_size :il, size
      end

      step "User opens dropdown to select the quantity of product" do
        it.open_qty_dropdown :il
      end

      step "User selects the quantity of product", '2' do |qty|
        it.select_quantity :il, qty
      end

      step "User clicks on the + Wish List button" do
        it.click_wish_list_button :il
      end

      step "User observes the product size" do
        it.observe_product_size
      end

      step "User clears the Wish List" do
        it.click_remove_wish_list :il
      end
=end
      sleep 3
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", settings('venus')['login_page'] do |url|
        page.visit url
      end

      step "User fills the Email field", settings('venus')['email'] do |email|
        it.fill_email_field :il, email
      end

      step "User fills the Pass field", settings('venus')['pass'] do |pass|
        it.fill_pass_field :il, pass
      end

      step "User clicks on the Sign In button" do
        it.click_sign_in_button :il
      end

      step "User clicks on the Sale category" do
        it.click_sale_cat :il
      end

      step "User opens dropdown in the Sale category" do
        it.open_cat_dropdown :il
        sleep 2 # need to wait loading the dropdown with subcategories
      end

      step "User chooses the subcategory in the dropdown",'Clothing Sale', 'Tops' do |*name|
        it.choose_subcat_by_first_name :il, name
      end

      step "User chooses a product by name in the list", 'love print top' do |name|
        it.choose_product_by_name name
      end
=begin can't reproduce: TA-999 (new issue)
      step "User chooses a size in the list", 'M' do |size|
        it.choose_list_size :il, size
      end

      step "User chooses a size in the list", 'L' do |size|
        it.choose_list_size :il, size
      end

      step "User opens dropdown to select the quantity of product" do
        it.open_qty_dropdown :il
      end

      step "User selects the quantity of product", '2' do |qty|
        it.select_quantity :il, qty
      end

      step "User clicks on the + Wish List button" do
        it.click_wish_list_button :il
      end

      step "User observes the product size" do
        it.observe_product_size
      end

      step "User clears the Wish List" do
        it.click_remove_wish_list :il
      end
=end
      sleep 3
    end


  end
end
