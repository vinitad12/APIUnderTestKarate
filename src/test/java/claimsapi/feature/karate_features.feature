Feature: Karate Claim Capabilities
Background: URL under test
    Given url app_url
    * def js_helper = read('classpath:/js_helper/helper.js')
    * configure report = { showLog: true, showAllSteps: false }
    * configure printEnabled = true
@regression
    Scenario: Creates a new activity associated with this claim
        Given def post_payload = read('classpath:/test_data/activity_on_a_claim.json')
        Given path 'claims/8/activities'
        And request post_payload
        When method post 
        Then status 201
        Then print response
        Then karate.log(response)
        #* java.lang.System.out.println(response)


# e2e - get claim from `claims` and the get detail about that claim -> http://localhost:4200/claims/008/
    #Scenario: Post a claim in the system,get that claimId from the system and then get detail on that claim
    @regression @e2e
    Scenario: Create new claim draft- notification post method - JS refactor code
        Given def post_request_data = read('classpath:/test_data/post_claim.json')
        * print post_request_data.requests[0].headers[1].value 
        Given random_func= js_helper().get_random
        * print post_request_data.requests[0].headers[1].value
        Given post_request_data.requests[0].headers[1].value= random_func()
        Given path 'claims_post'
        And request post_request_data
        When method post 
        Then status 200
        # save the claim id
        * def claimID = response.requests[0].headers[1].value
        # go to route http://localhost:4200/claims/<claimid>/
        Given path 'claims','/',claimID
        When method get
        Then status 200
        And match response..refid contains claimID+''

    @bulkload @smoke
    Scenario Outline: Create claims in buld - from examples
        * def result = call read('fixtures.feature@create_a_new_claim_draft') { claimID: <ClaimId> }
        * print result
        Examples:
        |ClaimId|
        |100    |
        |101    |

    
    @bulkload
    Scenario Outline: Create claims in buld - CSV feed
        * def result = call read('fixtures.feature@create_a_new_claim_draft') { claimID: <ClaimId> }
        * print result
        Examples:
        |read('classpath:/test_data/bulk_claims.csv')|
