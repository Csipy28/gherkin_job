Feature: Log in to Bitpanda

  Scenario: Blank log in
    Given user is on https://account.bitpanda.com/login page
    When leave the fields blank
    And click on Log in button
    Then after reCAPTCHA verification, the error messages will appear under the input fields: "The email field is required." and "The password field is required."

  Scenario: Valid log in
    Given user is on https://account.bitpanda.com/login page
    When add valid email and password
    And click on Log in button
    Then the homepage of the personal account will be visible

  Scenario: Incorrect email log in
    Given user is on https://account.bitpanda.com/login page
    When type in incorrect (but valid) e-mail address with correct password
    And click on Log in button
    Then "Login credentials incorrect" message

  Scenario: Incorrect password log in
    Given user is on https://account.bitpanda.com/login page
    When type in a correct e-mail address with incorrect (but valid) password
    And click on Log in button
    Then "Login credentials incorrect" message

  Scenario: Incorrect email and password log in
    Given user is on https://account.bitpanda.com/login page
    When type in a incorrect (but valid) e-mail address with incorrect (but valid) password
    And click on Log in button
    Then "Login credentials incorrect" message

  Scenario: Invalid email log in
    Given user is on https://account.bitpanda.com/login page
    When type in invalid e-mail address with correct password
    And click on Log in button
    Then "The email must be a valid email address." message

  Scenario: Invalid password log in
    Given user is on https://account.bitpanda.com/login page
    When type in a correct e-mail address with invalid password
    And click on Log in button
    Then "Login credentials incorrect" message

  Scenario: Incorrect email and password log in
    Given user is on https://account.bitpanda.com/login page
    When type in a incorrect e-mail address with incorrect password
    And click on Log in button
    Then "The email must be a valid email address." message