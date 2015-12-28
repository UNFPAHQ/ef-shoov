Feature:
  In order to be able to view the publications page
  As an anonymous user
  We need to be able to have access to the publications page


  @api
  Scenario Outline: Check that we get a default set of articles that appear on
                    the page when we have no filters.
    Given I am an anonymous user
    When  I visit the "publications" page
    Then  I should see "<title>"
  Examples:
    | title                                     |
    | Maternal Health Thematic Fund 2014 Report |
    | UN resolution on fistula 2014             |
    | The Campaign to End Fistula: 10 Years On  |
    | Maternal Health Thematic Fund 2013 Report |


  @api
  Scenario: Check the articles filters.
    Given I am an anonymous user
    When  I visit the "publications" page
    And   I set the filters:
      | title | edit-title                                   | UN report on obstetric fistula 2014 |
      | year  | edit-field-publication-date-value-value-year | 2015                                |
    And   I press "Go"
    Then  I should see "UN report on obstetric fistula 2014"
