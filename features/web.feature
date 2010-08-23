Feature: The web API

  Scenario: Fetching an invoice
    Given I accept HTML
    When I go to "/invoices/4c6c0cf7b284e32154000084"
    Then the request should succeed
      And I should see "The reference of the invoice you are viewing is"
      And I should see "/invoices/4c6c0cf7b284e32154000084"
      And I should see "Gob Bluth"

