@ignore
Feature: Fixtures, not part of auto execution
    
Background:
    Given url app_url

@create_a_new_claim_draft
Scenario: Create new claim draft- notification post method - FIXTURE
    Given def post_request_data = read('classpath:/test_data/post_claim.json')
    * print claimID ,"-------------------"
    Given post_request_data.requests[0].headers[1].value= claimID
    Given path 'claims_post'
    And request post_request_data
    And print post_request_data
    When method post 
    Then status 200
    And match post_request_data.requests[0].headers == response.requests[0].headers

