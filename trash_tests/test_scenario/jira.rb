require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Main Page testing' do
    visit 'http://jira.hillel.it:8080/login.jsp'

    # Login to jira
    find(ta('p:jira:liginpage:loginFld')).set('webinar5')
    find(ta('p:jira:liginpage:passwordFld')).set('webinar5')
    find(ta('p:jira:liginpage:rememberMyLoginCheckbox')).click
    find(ta('p:jira:liginpage:loginBtn')).click

    # Open first ticket
    find(ta('p:jira:mainPage:firstTicket')).click

    sleep 1

    find(ta('p:jira:mainPage:ticketPage:activityAll')).click
    sleep 1

    find(ta('p:jira:mainPage:ticketPage:activityComments')).click
    sleep 1

    find(ta('p:jira:mainPage:ticketPage:activityHistory')).click
    sleep 1
    #
    find(ta('p:jira:mainPage:ticketPage:activityActivity')).click
    sleep 1
    page.go_back

    # Open second ticket
    find(ta('p:jira:mainPage:secondTicket')).click
    sleep 1
    page.go_back

    # Open third ticket
    find(ta('p:jira:mainPage:thirdTicket')).click
    sleep 1
    page.go_back

    # Open fourth ticket
    find(ta('p:jira:mainPage:fourceTicket')).click
    sleep 1
    page.go_back

    find(ta('p:jira:mainPage:createIssueBtn')).click
    find(ta('p:jira:createIssueForm:summaryFld')).set('summary text')
    find(ta('p:jira:createIssueForm:descriptionFld')).set('descriptionFld text')
    # find(ta('p:jira:createIssueForm:createIssueBtn')).click
    find(ta('p:jira:createIssueForm:cancelCreateIssueBtn')).click
    sleep 5
    page.go_back
    sleep 5


  end
end
