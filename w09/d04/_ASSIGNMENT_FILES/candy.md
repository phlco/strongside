# Candy Machine

# Machine

Properties

- Candy (integer | 0 min, 500 max)
- Money (float | 0.00)
- Location (string | is mandatory)
- Owner Id
- Candy Price

Action

- Sell
	- dispences 1 candy
	- takes in the price of the candy and adds it to the money a machine has

# Owner

- Properties
	- money
	- candy

- Take money (takes as an arg the machine)
	- removes money from the machine
	
- Restock (takes as an arg the machine as well as the number of candy)
	- takes the input for the number of candies to put in
	- but only up until 500
	- say
		- you try to restock a candy machine that has 450 candy in it
		- restock(100)
			- this will only fill it up by 50

- Buy Candy (takes in the number of candy they want to buy)
	- it costs .01 per 1 pieces of candy
		- removes .01 per 1 pieces of candy purchased
		- increases the level of candy by 1
	

	