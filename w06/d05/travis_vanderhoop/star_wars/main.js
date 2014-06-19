document.addEventListener('keydown', function(event) {
    if(event.keyCode == 72) {
        request = prompt('Help me obiwan kenobi');
        return request;
    }
});

var alderaan = document.getElementById('alderaan');
var deathStar = document.getElementById('death-star');
var formHolder = document.getElementById('form-holder');

textAppears = function(string) {
  this.textContent = string
}

destroyPlanet = function(planet) {
  planet.parentNode.removeChild(planet);
}

createForm = function() {
  var myForm = document.createElement('form');
      myForm.id = 'form';
      myForm.addEventListener('input', function() {
        // debugger;
        if (this.firstChild.value != "Yavin 4") { document.body.style.backgroundColor = "red" }
          else { document.body.style.backgroundColor = 'green'; }
        event.preventDefault();
      });
  var coordinateInput = document.createElement('input');
      coordinateInput.type = 'text';
      coordinateInput.name = 'location';

  // coordinateInput.placeholder = 'enter location';
  var submitButton = document.createElement('input');
      submitButton.type = 'submit';
      submitButton.id = 'secret-coordinates';
  myForm.appendChild(coordinateInput);
  myForm.appendChild(submitButton);
  formHolder.appendChild(myForm);
  event.preventDefault();

}



