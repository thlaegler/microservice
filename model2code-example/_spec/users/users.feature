@tenant=example-tenant 
@language=en-US 
Feature: Manage Users 


Scenario: As admin I want add a new user 
	When I request to add new user(s) 
		| 	username	 | 	name	 | 	email 	| 
		|	 SuperUser 	| 	SuperNewUser |	 user@user.com	 | 
	Then the response http code should be 201 
	And the response should contain 1 product(s) 
	And the 1 product's name should be "SuperNewSteamEngine"