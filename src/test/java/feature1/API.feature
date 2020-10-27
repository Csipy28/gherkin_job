Feature: API calls and tests for REQRES

  Scenario: List of the users on the first page

    Given API request is done for GET https://reqres.in/api/users?page=1
    And Tests value inserted pm.test("Status code is 200", function () {pm.response.to.have.status(200);});
    When click on Send button
    Then Response gives back of the list of the users on the first page
    And Tests result is passed "PASS Status code is 200"

  Scenario: Successful register

    Given API request is done for POST https://reqres.in/api/register
    And Inserted {"email": "eve.holt@reqres.in","password": "pistol"} into request body
    And Tests value inserted "pm.test("Status code is 200", function () {pm.response.to.have.status(200);});"
    When click on Send button
    Then Response gives back {"id": 4,"token": "QpwL5tke4Pnpja7X4"}
    And Tests result is passed "PASS Status code is 200"

  Scenario: Update data

    Given API request is done for PUT https://reqres.in/api/users/2
    And Tests value inserted "pm.test("Status code is 200", function () {pm.response.to.have.status(200);});"
    When click on Send button
    Then Response gives back {"updatedAt": "2020-10-26T15:27:07.301Z"}
    And Tests result is passed "PASS Status code is 200"

  Scenario: Delete data

    Given API request is done for PUT https://reqres.in/api/users/2
    And Tests value inserted "pm.test("Status code is 204", function () {pm.response.to.have.status(204);});"
    When click on Send button
    Then Response gives back No Content 204
    And Tests result is passed "PASS Status code is 204"

  Scenario: Unsuccessful register

    Given API request is done for POST https://reqres.in/api/register
    And Inserted {"email": "sydney@fife"} into request body
    And Tests value inserted "pm.test("Status code is 400", function () {pm.response.to.have.status(400);});"
    When click on Send button
    Then Response gives back {"error": "Missing password"}
    And Tests result is passed "PASS Status code is 400"



