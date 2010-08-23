Feature: The JSON API

  Scenario: Fetching an invoice
    Given I accept JSON
    When I go to "/invoices/4c6c0cf7b284e32154000084"
    Then I should see the JSON:
      """
      { "ref": "http://localhost:9292/invoices/4c6c0cf7b284e32154000084",
        "identifier": "154",
        "client": {
          "ref": "http://localhost:9292/clients/4c6c3bbbb284e3b847000014"
        } }
      """

  Scenario: Fetching a client
    Given I accept JSON
    When I go to "/clients/4c6c3bbbb284e3b847000014"
    Then I should see the JSON:
      """
      { "ref": "http://localhost:9292/clients/4c6c3bbbb284e3b847000014",
        "name": "Gob Bluth" }
      """

