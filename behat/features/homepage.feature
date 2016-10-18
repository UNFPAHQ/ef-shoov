Feature: Homepage
  In order to be able to view the homepage
  As an anonymous user
  We need to be able to have access to the homepage

  @api
  Scenario: Visit the homepage
    Given I am an anonymous user
    When  I visit the homepage
    Then  I should have access to the page


  @api
  Scenario Outline: Visit every link page from the homepage main sections.
    Given I am an anonymous user
    When  I visit the homepage
    Then  I should see the "<section>" with the "<link>" and have access to the link destination

  Examples:
    | section             | link                                            |
    | main menu           | Home                                            |
    | main menu           | What is Fistula?                                |
    | main menu           | The Campaign                                    |
    | main menu           | News                                            |
    | main menu           | Publications                                    |
    | news                | More News                                       |
    | publications        | More Publications                               |
    | videos              | Suffering in silence: Obstetric fistula in Asia |
    | videos              | More Videos                                     |
    | stay connected      | Facebook                                        |
    | stay connected      | Twitter                                         |
    | stay connected      | Youtube                                         |
    | footer              | Home                                            |
    | footer              | Contact Us                                      |
    | footer              | What is Fistula                                 |
    | footer              | The Campaign                                    |
    | footer              | Terms of Use                                    |
    | footer              | News                                            |
    | footer              | Publications                                    |
    | footer social links | Twitter                                         |
    | footer social links | Facebook                                        |
    | footer social links | Youtube                                         |
