Feature: Determining which type of content to return

  Scenario: When the client accepts JSON
    Given I accept JSON
    When I go to "/invoices/4c6c0cf7b284e32154000084"
    Then the request should succeed
      And I should receive JSON

  Scenario: When the client accepts HTML
    Given I accept HTML
    When I go to "/invoices/4c6c0cf7b284e32154000084"
    Then the request should succeed
      And I should receive HTML

  Scenario: When the client accepts HTML and JSON
    Given I accept HTML and JSON
    When I go to "/invoices/4c6c0cf7b284e32154000084"
    Then the request should succeed
      And I should receive HTML

  Scenario: When the client accepts */*, but does not explicity specify JSON
    Given I accept wildcard formats, but not JSON
    When I go to "/invoices/4c6c0cf7b284e32154000084"
    Then the request should succeed
      And I should receive HTML

  Scenario: When the client accepts */*, and also specifies JSON
    Given I accept wildcard formats, and JSON
    When I go to "/invoices/4c6c0cf7b284e32154000084"
    Then the request should succeed
      And I should receive JSON

  Scenario: When the client doesn't accept wildcards, HTML, or JSON
    Given I accept nothing
    When I go to "/invoices/4c6c0cf7b284e32154000084"
    Then the request should fail

