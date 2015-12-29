Feature: Footer
  In order to be able to view the site Footer
  As an anonymous user
  We need to be able to have access to the footer


  @api
  Scenario Outline: Visit every main link page from the site footer.
    Given I am an anonymous user
    When  I visit the homepage
    Then  I should see the "<section>" with the "<link>" and have access to the link destination

  Examples:
    | section             | link            |
    | footer              | Home            |
    | footer              | Contact Us      |
    | footer              | What is Fistula |
    | footer              | The Campaign    |
    | footer              | Terms of Use    |
    | footer              | News            |
    | footer              | Publications    |
    | footer social links | Twitter         |
    | footer social links | Facebook        |
    | footer social links | Youtube         |
