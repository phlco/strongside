Homework Section

## Pokemon#recover
- increases your health by 10 and your energy by up until you hit 100 at which point you cannot recover any more	
	- health: 80
	- energy: 90
	
	- health: 90
	- energy: 100 	
	
	- health: 100
	- energy: 100
	
	- health: 100
	- energy: 100


## Pokemon#attack

```
dog = #some existing pokemon
cat = #some other existing pokemon

dog.attack(cat)

```

- for the dog
	- the dog can only attack if it has at least a level of 10 energy (you cannot attack if you don't have 10 energy)
	- when do you attack, it reduces your energy by 10
- for the cat
	- if the attack goes through, the cat's health will go down by 10.



---



Trainer
  - properties
    - name
    - email
    - password
    - password_confirmation
      - I want people to be able to login with a username and password
    (bcrypt)

  - validations
    - a user should also have email
      - email should be unique
    - password needs to be at least 6 charachters

  - has_many :pokemons

Pokemon

  - belongs_to :trainer

  - properties
    - name
    - species
    - health
      - starts at 80 and is capped at 100
    - energy
      - start at 80 and is also capped at 100

  - validations / things to test for

    - if the trainer dies (or is destroyed), the pokemon are destroyed as well
    - they must belong to a trainer
    - initial conditions
      - validate that they have a name, spiecies
      - when they are born
        - their health starts at 80
        - their energy also starts at 80





Steps:

rails g model pokemon name:string species:string health:integer energy:integer trainer_id:integer


rails g model pokemon name:string species:string health:integer energy:integer trainer_id:integer
