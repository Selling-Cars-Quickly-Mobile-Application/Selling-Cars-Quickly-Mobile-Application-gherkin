Feature: Certification management
  In order to validate competencies
  As an administrator or system
  I want to issue and retrieve certifications

  Scenario: Issue certificate (US-015)
    Given I am authenticated as "admin@example.com" with password "Admin#123"
    When I issue a certificate for user "user@example.com" with code "CERT-001"
    Then the response status should be 201
    And the response body should include field "certId"

  Scenario: Get certificate (US-007)
    Given a certificate is already issued
    When I request the certificate by code "CERT-001"
    Then the response status should be 200
    And the response body field "codigo" should equal "CERT-001"