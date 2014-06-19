// this is my file
// ---------------
console.log('hi');


// If you mouseover alderaan or death-star their respective names should appear.

var alderaan = document.getElementById("alderaan");
var death_star = document.getElementById("death-star");

var mouseOverAlderaan = function() {
  alderaan.textContent = "Alderaan"
}

var mouseOutAlderaan = function() {
  alderaan.textContent = ""
}

alderaan.addEventListener("mouseover", mouseOverAlderaan);

alderaan.addEventListener("mouseout", mouseOutAlderaan);

var mouseOverDeathStar = function() {
  death_star.textContent = "Death Star"
}

var mouseOutDeathStar = function() {
  death_star.textContent = ""
}

death_star.addEventListener("mouseover", mouseOverDeathStar);

death_star.addEventListener("mouseout", mouseOutDeathStar);

// If you click on button#never the alderaan div should be removed
// when a user clicks on the never button
// alderaan div is removed

var neverButton = document.getElementById("never");

var removeAlderaan = function(e) {
  // we want this function to remove the div with id alderaan
  alderaan.parentNode.removeChild(alderaan);
}

neverButton.addEventListener("click", removeAlderaan);

// If you click on a#tell make a new form with a text with the name location and a button with the id of secret-coordinates

var tellLink = document.getElementById("tell");

var generateTellFormCounter = 0;

var generateTellForm = function(e) {
  // we want this function to add a form comprising a text input and button with id secret-coordinates
  if (generateTellFormCounter === 0) {
    var form = document.createElement("form");

    var input = document.createElement("input");
    input.setAttribute('type', "text");
    input.setAttribute('name', "location");

    var button = document.createElement("button");
    button.setAttribute('type', "button");
    button.setAttribute('id', "secret-coordinates");

    form.appendChild(input);
    form.appendChild(button);

    document.body.appendChild(form);
    generateTellFormCounter++
  }

  e.preventDefault();

  var submitCoordinates = document.getElementById("secret-coordinates");

  submitCoordinates.addEventListener("click", tellCoordinates);
}

tellLink.addEventListener("click", generateTellForm);

// If you type Yavin 4 into input[name=location] the body background should turn green otherwise make the body red

var tellCoordinates = function(e) {

  var coordinates = document.getElementsByName("location")[0].value

  if (coordinates === "Yavin 4") {
    document.body.style.backgroundColor = "green";
  } else {
    document.body.style.backgroundColor = "red";
  }
}

// If you press H a text input with the name help-me and a button with the id secret-message should appear.
var generateHelpFormCounter = 0;

var generateHelpForm = function(e) {
  if (generateHelpFormCounter === 0) {
    var helpForm = document.createElement("form");

    var helpInput = document.createElement("input");
    helpInput.setAttribute('type', "text");
    helpInput.setAttribute('name', "help-me");

    var helpButton = document.createElement("button");
    helpButton.setAttribute('type', "button");
    helpButton.setAttribute('id', "secret-message");

    helpForm.appendChild(helpInput);
    helpForm.appendChild(helpButton);

    document.body.appendChild(helpForm);
    generateHelpFormCounter++
  }
  e.preventDefault();

  var secretMessage = document.getElementById("secret-message");

    var letter = String.fromCharCode(event.keyCode);
  if (letter === "H") {

  secretMessage.addEventListener("keypress", askForHelp);
}


// If you type Help me Obi Wan, you're my only hope into input[name=help-me] the background should change to blue.

var askForHelp = function(e) {

    var helpRequest = document.getElementsByName("help-me")[0].value

    if (helpRequest === "Help me Obi Wan, you're my only hope!") {
    document.body.style.backgroundColor = "blue";
    }
  }
}
