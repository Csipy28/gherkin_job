Feature: Registration to Bitpanda
  Register personal or business account to Bitpanda
  After fill in the form with vald data, complete the registration through an email validation and answer the aml questions.
  Just after these steps will be available the homepage of the personal account.

  Scenario: Register with blank fields
    Given user is on https://account.bitpanda.com/en/register page
    When leave the fields blank
    And click on Create account button
    Then after reCAPTCHA verification, the empty fields turn into red and throw error messages with the text: the given field is required.

  Scenario: Valid Registration inputs
    Given user is on https://account.bitpanda.com/en/register page
    When type in valid first name, last name, email, password, choose a residence. Accept the Terms&Conditions and Privacy Policy swithers
    And click on Create account button
    Then “Thank you for signing up” title will be visible and make sure you are on the page: https://account.bitpanda.com/en/register/success
    And Get an email with the subject “Please confirm your email address” to your mailbox

  Scenario: Valid registration email confirmation
    Given user opens the confirmation email after the registration
    When click on "confirm email address" button in the email
    Then open a new window with the text: “Welcome to Bitpanda! Just two more steps to start trading” will be visible and make sure you are on the https://account.bitpanda.com/aml/questions page

  Scenario: Valid registration aml questions
    Given user can see “Welcome to Bitpanda! Just two more steps to start trading” message and are on the https://account.bitpanda.com/aml/questions page
    When opt in 1 option amongst the radio buttons and click continue or next, same movements at all the 6 questions
    And click next after the last, 6th question
    Then automatically sign in to your account on https://web.bitpanda.com/home

  Scenario: Invalid email registration
    Given user is on https://account.bitpanda.com/en/register page
    When type in valid first name, valid last name, invalid email (without @), valid password, choose a residence.
    And accept the Terms & Conditions and Privacy Policy swithers
    And click on Create account button
    Then “The email must be a valid email address.” error message under the email field. (However the bracket of the field is already red when I click out the field with invalid email)

  Scenario: Invalid password registration with short password value
    Given user is on https://account.bitpanda.com/en/register page
    And fill in the fields with valid values except the password field
    When type in a password into the password field, with lowercase and uppercase and numbers, 8 characters
    And click on Create account button
    Then "Your password is too short" error message

  Scenario: Invalid password registration with just number values
    Given user is on https://account.bitpanda.com/en/register page
    And fill in the fields with valid values except the password field
    When type in a 12 character password into the password field, with just numbers
    And click on create account button
    Then "Your password must contain one uppercase and one lowercase letter" error message

  Scenario: Invalid password registration with just lowercase values
    Given user is on https://account.bitpanda.com/en/register page
    And fill in the fields with valid values except the password field
    When type in a 16 character password into the password field, with just lowercase letters
    And click on create account
    Then "Your password must contain one uppercase and one lowercase letter" error message

  Scenario: Invalid password registration with just uppercase values
    Given user is on https://account.bitpanda.com/en/register page
    And fill in the fields with valid values except the password field
    When type in a 16 character password into the password field, with just uppercase letters
    And click on create account
    Then "Your password must contain one uppercase and one lowercase letter" error message

  Scenario: Invalid password registration with long password value
    Given user is on https://account.bitpanda.com/en/register page
    And fill in the fields with valid values except the password field
    When type in a 100 character password into the password field, with uppercase, lowercase and numbers letters
    And click on create account
    Then "Maximum 72 characters error message" error message

  Scenario: Invalid password registration without number value
    Given user is on https://account.bitpanda.com/en/register page
    And fill in the fields with valid values except the password field
    When type in a 18 character password into the password field, with uppercase, lowercase
    And click on create account
    Then "The password must contain one number" error message

  Scenario: Residence field clicking
    Given user is on https://account.bitpanda.com/en/register page
    And fill in the fields with valid values except the residence field
    When click into the residence field
    Then the placeholder will be move as the title of the field

  Scenario: Residence field autocomplete
    Given user is on https://account.bitpanda.com/en/register page
    And fill in the fields with valid values except the residence field
    When click into the residence field
    And start to type in a letter (as the first letter of a country)
    Then after typed in the first letter, the countries, which start with the similar letter, will be visible under each other

  Scenario: Residence field country choose
    Given user is on https://account.bitpanda.com/en/register page
    And fill in the fields with valid values except the residence field
    And click into the residence field
    And start to type in a letter (as the first letter of a country)
    And appear the countries, which start with the similar letter, will be visible under each other
    When click on one specific country
    Then the chosen country fill in the residence field

  Scenario: Blank residence field
    Given user is on https://account.bitpanda.com/en/register page
    And fill in the fields with valid values except the residence field
    And if there is a default country name, delete it
    When click on create account button
    Then should be visible an error message to fill in the residence field

  Scenario: Invalid word in the residence field
    Given user is on https://account.bitpanda.com/en/register page
    And fill in the fields with valid values except the residence field
    And click into the residence field
    And type in a random word, which is not a country name,into the empty residence field
    When click on No items found as an option of the dropdown
    Then the country list of the dropdown is going to be visible

  Scenario: Policy acceptance 1st
    Given user is on https://account.bitpanda.com/en/register page
    And accept the first policy switcher
    When click on create account button
    Then the second policy lines are moving, to notice accept that one too, because it is essential

  Scenario: Policy acceptance 2st
    Given user is on https://account.bitpanda.com/en/register page
    And accept the second policy switcher
    When click on create account button
    Then the first policy lines are moving, to notice accept that one too, because it is essential

  Scenario: Policy acceptance 3rd
    Given user is on https://account.bitpanda.com/en/register page
    And accept the third policy switcher
    When click on create account button
    Then the first and second policy lines are moving, to notice accept that one too, because it is essential

  Scenario: Policy acceptance 1st and 3rd
    Given user is on https://account.bitpanda.com/en/register page
    And accept the first and third policy switcher
    When click on create account button
    Then the second policy lines are moving, to notice accept that one too, because it is essential

  Scenario: Policy acceptance 2nd and 3rd
    Given user is on https://account.bitpanda.com/en/register page
    And accept the second and third policy switcher
    When click on create account button
    Then the first policy lines are moving, to notice accept that one too, because it is essential


