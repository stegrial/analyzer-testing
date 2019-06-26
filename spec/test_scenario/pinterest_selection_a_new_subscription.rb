require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Pinterest  checking the selection of a new subscription from the recommendations' do
    visit 'https://www.pinterest.com/'

     sleep 1
      find(ta('Jul:pinterest:sign_in:emailField')).set('arapova.jul2@gmail.com')
      #find(:id, 'email').set('arapova.jul2@gmail.com')
      find(ta('Jul:pinterest:sign_in:pass_Field')).set('4321test')
      #find(:id, 'password').set('4321test')
      #find(:xpath, ta('Jul:pinterest:sign_in:OkButton:acceptBtn')).click
      find(:xpath, "//button[@class='red SignupButton active']").click

     sleep 3
      #find(:xpath, "//div[text()='Подписки']").click
      find(:xpath, ta('Jul:pinterest:following:subscriptions:topMenu', "//div[text()='Подписки']")).click
      #find(ta('Jul:pinterest:following:subscriptions:topMenu')).click

     sleep 3
      #find(:xpath, "//button[@class='_r5 _4s _r9 _4q _r6 _33 _rf _35 _r7 _xx _zc _rb _yb _47']").click
      find(:xpath, ta('Jul:pinterest:following:findRecomendation:btn', "//button[@class='_r5 _4s _r9 _4q _r6 _33 _rf _35 _r7 _xx _zc _rb _yb _47']")).click
      #find(ta('Jul:pinterest:following:findRecomendation:btn')).click

      #find(:xpath, "(//div[@class='_wa _0 _1 _2 _wc _3a _d _b _6'])[7]").click
      find(:xpath, ta('Jul:pinterest:following:modal:more', "(//div[@class='_wa _0 _1 _2 _wc _3a _d _b _6'])[7]")).click
      #find(ta('Jul:pinterest:following:modal:more')).click  #//Don't work in picker

      #find(:xpath, "(//div[@class='_5t _6f _6u _h _xx _4s'])[24]").click
      find(:xpath, ta('Jul:pinterest:following:modal:more:tattoo', "(//div[@class='_5t _6f _6u _h _xx _4s'])[24]")).click
      #find(ta('Jul:pinterest:following:modal:more:tattoo')).click

      #find(:xpath, "(//div[@class='_5m _h _xx _4s'])[5]").click
      find(:xpath, ta('Jul:pinterest:following:modal:fourthCategory', "(//div[@class='_5m _h _xx _4s'])[5]")).click
      #find(ta('Jul:pinterest:following:modal:fourthCategory')).click

     sleep 3
  end
end
