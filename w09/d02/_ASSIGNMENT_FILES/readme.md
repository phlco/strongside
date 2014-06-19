	# w09_d02

- Inside of HashWork in today's folder inside your own name folder, create a new folder called `morning`
- Then initialize create a new rspec rproject inside of it that has guard, guard-rspec
- Create the appropriate files (lib/user.rb) (spec/user_spec.rb)

### Create A User Class
---
Create a class User which has the following "getter" methods:

- gender
- first_name
- last_name
- age
- married?

#### 1. Life Badges

Adding to the User class that you created above, add another method `abilities` that returns an array of symbols representing things that you can do in life:

- when you're 16, return  [:drive]
- when you're 18, return [:drive, :vote]
- when you're 25, return [:drive, :vote, :rent_car]
- when you're 35, return [:drive, :vote, :rent_car, :president]

#### 2. Name Game

Adding to the User class that you created above, create a method on the user object called `formal_name` that does the following:

If the person is female and 20 or over and is married,display "Mrs." in front of her name. If not, display "Ms." in front of her name. If the female is under 20, display her first and last name.

If the person is male and 20 or over, display "Mr." in front of his name. Otherwise, display his first and last name.

#### 3. Refactoring your Specs
 
- Use a Describe block to encapsulate each method.

# Modeling Simple Objects in Ruby

-[10 minute group brainstorming]
	- Lamp
	- Stapler
-[5 minute class regroup]
-[1 minute HipChat Out Specifications]
-Your Order of Operations
	- Lamp
	- Stapler
	- If you finish early, try modeling out and writing tests for the next examples.


### Lamp
---

Hi, my name is Peter and you've been recomended to model the IKEA online store, starting with our IGVÄR lamp. For now, I don't really care about the color, or look of the lamp, I just want to be able to model the turning on and off of a lamp.

### Stapler
---

Hi, my name is Ronald, I am the president of Staples Inc. I want you to write the following tests and accompanying code to model a stapler.

# Modeling More Complex Objects in Ruby

-[15 minute group brainstorming]
	- Build a Specification (not a test) for Vending Machine
-[10 minute class regroup]
-[1 minute HipChat Out Specifications]
-Your Order of Operations
	- Starting Building tests for a vending machine


### Vending Machine
---

Part 1: How would you model a vending machine that has only 1 row of snacks?

Part 2: How would you model it if you had to calculate change?


### CitiBike [EXTRA, the goal is to finish the above]
---

I'm mayor bloomberg and I want to model a system to track all of the CitiBikes.

There are many CitiBike Stations scattered around NYC. For a given station, I want to be able to add new bikes to the station when the truck drops off a new shipment of bikes. Also want to be able to track when someone checks in a bike and checks out a bike.

Also, for a given station, at any point, I want to be able to find out how many bikes it has and in the entire system, how many bikes are checked in, and how many bikes have been checked out and not accounted for.

# Rails Testing

### Bank Accounts

# Modules and Modeling more Complex Functions
---

# Rails Testing

## Store
---
[Store Specification](https://github.com/ga-students/WDI_NYC_Hash/blob/master/week_06/js/d4_modeling/store_main.js)

- Include Module for Name Generation


# KickHash Dinner RSVP
[Link](https://docs.google.com/forms/d/19ZoXOoIVmpmv7WPVC3QD0a9X97tooCpXoT3rg0bTvp0/viewform)