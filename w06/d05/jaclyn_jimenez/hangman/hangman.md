#The Hangman Game:

# Using BDD and Jasmine

Create a HangMan

Rules of Hangman 

- When a player starts a new game the secret word is shown as dashes
- A player must try and guess the secret word
- A player can make one guess at a time
- A player can't guess more than a single letter at a time
- If a player makes more than 5 incorrect guesses the game is over
- If a player guesses the same incorrect letter twice it should only count as one incorrect guess
- If a player guesses a correct letter, every instance of that letter should be revealed
- The game should show all guesses so the player doesn't repeate themselves
- If a player guesses all the letters the game is over
- If a player asks for a hint, a letter is revealed
- If a player asks for a hint, the first hint is free, each additional hint subtracts a point
- If a player gives up show the answer



```
var hangman = new Game(["true detective"]) // _ _ _ _  _ _ _ _ _ _ _ _

hangman.guess("a") // false
hangman.guess("t") // t _ _ _  _ _ t _ _ t _ _ _
hangman.guess("a") // false
hangman.guesses    // [ "t", "a" ]
hangman.guess("h") // false
hangman.incorrect  // 2

hangman.hint()     // t _ _ e  _ e t e _ t _ v e
hangman.incorrect  // 2
hangman.hint()     // t r _ e  _ e t e _ t _ v e
hangman.incorrect  // 3
hangman.giveUp()   // t r u e  d e t e c t i v e

# Bonus can you hide the secret word so it' not in the hangman object?

var properties = [];
for ( var prop in hangman ) {
    if ( hangman.hasOwnProperty(prop) ) {
        properties.push(prop);
    }
}
console.log( properties );
```