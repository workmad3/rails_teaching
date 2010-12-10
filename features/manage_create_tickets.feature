Feature: Create Ticket
  In order to record a problem
  User
  wants to be able to create a new ticket
  
  Scenario: Register new create_ticket
    Given I am on the new ticket page
    When I fill in "Subject" with "something..."
    And I press "Create"
    Then I should be on the ticket page for "something..."
    And I should see "ticket is created"
    And I should see "something..."

