console.log("Works!")

var alderaan = document.getElementById('alderaan');
var deathStar = document.getElementById('death-star');

function revealName(e) {
 var name = this.id;
 this.textContent = name;
}

function removeName(e) {
  this.textContent = "";
}

alderaan.addEventListener("mouseover", revealName);
deathStar.addEventListener("mouseover", revealName);

alderaan.addEventListener("mouseout", removeName);
deathStar.addEventListener("mouseout", removeName);


// If you click on button#never the alderaan div should be removed

var btnDelete = document.getElementById('never')

function deleteAlderaan() {
  alderaan.parentNode.removeChild(alderaan)
}

btnDelete.addEventListener("click", deleteAlderaan)