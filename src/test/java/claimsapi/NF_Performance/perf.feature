Feature: GW Claim API Demo 
    
Background:
* url 'http://localhost:4200'

#Scenario: Post a claim
#    Given def post_request_data = read('classpath:/test_data/post_claim.json') 
#    Given path 'claims_post'
#    And request post_request_data
##    When method post 
#   Then status 200
#    And match post_request_data.requests[0].headers == response.requests[0].headers


Scenario: Get all the claims in the system - failed case
    Given path 'claims'
    When method get
    Then status 200

    * print  response['Error']
    * assert response['Error'] == 'Invalid API Key' 


Scenario: Get all the claims in the system - returns claim ids
Background: configure headers = { APIKEY: 'very_hard_to_crack' }
    
    Given path 'claims' 
    And header  APIKEY = 'very_hard_to_crack' 
    When method get
    Then status 200

    * print  response   
    * match response.Error == '#notpresent'

Scenario: Create claim - notification post method
    Given def post_request_data = read('classpath:/test_data/post_claim.json')
    * print post_request_data.requests[0].headers[1].value 
    Given random_func= function(){return Math.floor(Math.random() * 100);}
    * print post_request_data.requests[0].headers[1].value
    Given post_request_data.requests[0].headers[1].value= random_func()
    Given path 'claims_post'
    And request post_request_data
    When method post 
    Then status 200
    And match post_request_data.requests[0].headers == response.requests[0].headers
    
