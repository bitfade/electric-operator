Feature: Haskell mode
  Background:
    When the buffer is empty
    When I turn on haskell-mode
    When I turn on electric-operator-mode


  # Infix vs prefix operators
  Scenario: Infix +
    When I type "1+2"
    Then I should see "1 + 2"

  Scenario: Infix + inside parens
    When I type "(1+2)"
    Then I should see "(1 + 2)"

  Scenario: Prefix +
    When I type "(+ 1 2)"
    Then I should see "(+ 1 2)"

  Scenario: Potential prefix operator as first character of file
    When I type "-1"
    Then I should see "-1"


  # Infix - doesn't break other things
  Scenario: Infix - operator
    When I type "e-b"
    Then I should see "e - b"

  Scenario: Negative numbers
    When I type "a=-1"
    Then I should see "a = -1"

  Scenario: Prefix -
    When I type "(- 1 2)"
    Then I should see "(- 1 2)"


  # Infix / doesn't break other things
  Scenario: #! / operator
    When I type "#! /bin/bash"
    Then I should see "#! /bin/bash"

  Scenario: Infix /
    When I type "a/b"
    Then I should see "a / b"

  Scenario: Prefix /
    When I type "(/ 1 2)"
    Then I should see "(/ 1 2)"
