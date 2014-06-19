User
- properties
  - email
  - password
  - password_confirmation

I want people to be able to log in with a username and password (bcrypt)
- a user should have an email
  - should be unique
- password needs to be at least 6 characters

Pokemon
- properties
  - name
  - species
  - health: starts at 100, capped at 100
  - energy: starts at 100, capped at 100
- methods
  - recover: increases your health by 10;
  - attack(other_pokemon)
    - your energy goes down by 10
    - the health of the other pokemon goes down by 10