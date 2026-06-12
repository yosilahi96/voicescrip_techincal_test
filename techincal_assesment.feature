  Scenario Outline: API GET /transcripts/:id
    Given user using "<api_key>" to access transcripts_id API
    When user set "<request_body>" 
    And user send a "<http_method>" request to "<transcripts_id_endpoint>"
    Then the response code should be "<response_code>"
    And the JSON response should follow schema "<response_json>"

    Examples:
      | api_key         | request_body         | | http_method | transcripts_id_endpoint | response_code | response_json           |
      | valid_api_key   | valid_request_body   |  GET          | /transcripts/valid_id   | 200           | valid_response_json     |
      | invalid_api_key | valid_request_body   |  GET          | /transcripts/invalid_id | 404           | invalid_response_json   |
      | valid_api_key   | valid_request_body   |  POST         | /transcripts/valid_id   | 405           | invalid_response_json   |
      | valid_api_key   | valid_request_body   |  PUT          | /transcripts/valid_id   | 405           | invalid_response_json   |
      | valid_api_key   | valid_request_body   |  PATCH        | /transcripts/valid_id   | 405           | invalid_response_json   |
      | valid_api_key   | valid_request_body   |  DELETE       | /transcripts/valid_id   | 405           | invalid_response_json   |
      | valid_api_key   | invalid_request_body |  GET          | /transcripts/valid_id   | 400           | invalid_response_json   |

##Notes
In this case im using API GET /transcripts/:id to be automated
1. Using scenario outline on BDD Gherking scenario to make the code clean, we can just seperate each case into each scenario but its not efficient and will make the automation test time increased
2. The examples is to test different value that we want to test, e.g : transcripts_id_endpoint has valid_id and invalid_id it means we test the API using the id that can be proceed and id that cannot be proceed, is the same as the api key and schema
3. Actually we can just skip the schema checking when automate API but its not a best practice, we need to make sure when the response data is correct we need to check the schema as well to avoid invalid structure of the API



