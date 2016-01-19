Feature: User searching for racecourses

  Scenario: User searches successfully
    When I search for the racecourses near to me
    Then I want to see a list of the nearest racecourses

  Scenario: User gets no results
    Given there are no racecourses near to me
    When I search for the racecourses near to me
    Then I want to know there are no results

