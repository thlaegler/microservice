@tenant=example-tenant 
@language=en-US 
Feature: Manage Products 


Scenario: As admin I want add a new product 
	When I request to add new product(s) 
		| code | name | description | price|
		| 1234 | SuperNewSteamEngine | The description | 129,99 |
	Then the response http code should be 201 
	And the response should contain 1 product(s) 
	And the 1 product's name should be "SuperNewSteamEngine"