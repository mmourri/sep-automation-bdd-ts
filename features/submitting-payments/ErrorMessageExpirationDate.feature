@sep27
Feature: Error messages for the invalid expiration number

    As a user, I want to be informed when my card's expiration date has failed. 

    #* AC1: An immediate error message should be thrown if the expiration number is too short or wrong:
    #*              Your card's expiration date is incomplete.
    #*              Your card's expiration year is in the past.

    Background:
        Given user is on the enrollment page
        And user has completed start application step
        And user has completed payment plan step

    Scenario Outline: Verify error message when expiration date is entered
        When user enters the "<expiration_date>"
        And user clicks the terms and conditions checkbox
        Then the error message "<error_message>" should be displayed immediately

    Examples:
        | expiration_date | error_message                                    |
        | 02/26           | Your card’s expiration date is in the past.      |
        | 03/25           | Your card’s expiration year is in the past.      |
        | 12/             | Your expiration date is incomplete.              |
        | 11/2            | Your expiration date is incomplete.              |
        