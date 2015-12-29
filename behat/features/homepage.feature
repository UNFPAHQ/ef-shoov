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
    | section         | link                                            |
    | news            | 16 girls, 16 stories of resistance              |
    | news            | A step forward in preventing fistula            |
    | news            | More News                                       |
    | publications    | Maternal Health Thematic Fund 2014 Report       |
    | publications    | New UN resolution on fistula 2014               |
    | publications    | More Publications                               |
    | videos          | Suffering in silence: Obstetric fistula in Asia |
    | videos          | More Videos                                     |
    | stay connected  | Facebook                                        |
    | stay connected  | Twitter                                         |
    | stay connected  | Youtube                                         |
