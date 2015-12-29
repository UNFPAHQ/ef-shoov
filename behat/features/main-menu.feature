Feature: MainMenu
  In order to be able to view the menu links
  As an anonymous user
  We need to be able to have access to the menu links pages

  @api
  Scenario Outline: Visit every link page from the main menu links.
    Given I am an anonymous user
    When  I visit the homepage
    Then  I should see the "<section>" with the "<link>" and have access to the link destination

    Examples:
    | section   | link              |
    | main menu | Home              |
    | main menu | What is Fistula?  |
    | main menu | The Campaign      |
    | main menu | News              |
    | main menu | Publications      |
