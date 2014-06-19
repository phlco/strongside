console.log('in a galaxy far far away...');

window.onload = function() {

  var alderaan = document.getElementById('alderaan');
  var deathStar = document.getElementById('death-star');
  var planets = document.getElementsByClassName('planet');
  var never = document.getElementById('never');
  var tell = document.getElementById('tell')
  var form = document.getElementById('form');
  var secretCoordinates = document.getElementById('secret-coordinates');
  var createInput = document.createElement('input');
  var createButton = document.createElement('button');

  alderaan.addEventListener("mouseover", fnMouseOva);
  alderaan.addEventListener("mouseout", fnMouseOff);
  deathStar.addEventListener("mouseover", fnMouseOva);
  deathStar.addEventListener("mouseout", fnMouseOff);
  never.addEventListener("click", function(e){alderaan.parentElement.removeChild(alderaan);});
  tell.addEventListener("click", function(e){
    e.preventDefault();
    form.style.display = "";
  })
  secretCoordinates.addEventListener("click", fnChangeColor);
  document.addEventListener("keypress", function (e) {
    var letter = String.fromCharCode(e.keyCode);
    if(letter === "h") {
     var newIn = createInput;
         newIn.name = "help-me";
         newIn.placeholder = "helpme";
     var newBut = createButton;
         newBut.id = "secret-message";
      document.body.appendChild(newIn);
      document.body.appendChild(newBut);
    }
  }
    );
}

function fnMouseOva(e){
  this.innerHTML = this.id;
}

function fnMouseOff(e) {
  this.innerHTML = "";
}

function fnChangeColor(e) {
  e.preventDefault();
  if (form.children[0].value === "yavin-4") {
  document.body.style.background = "green";
} else {
  document.body.style.background = "red";
}
}
