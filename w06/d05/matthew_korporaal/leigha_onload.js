window.onload = function() {
  var dStar = document.getElementById("death-star");
  var aRaan = document.getElementById("alderaan");
  var neverTell = document.getElementById("never");
  var tell = document.getElementById("tell");

  var nameAppear = function(e){
    this.textContent = this.id;
  }
  var nameDisappear = function(e){
    this.textContent = "";
  }
  var aRaanRemove = function(e){
    aRaan.remove();
  }

  var newLocationForm, newButton, newText, a;
  var addNewLocationForm = function(e){
    e.preventDefault();
    newLocationForm = document.createElement("form");
    newText = document.createElement('input');
    newText.type = "text";
    newText.id = "location";
    newLocationForm.appendChild(newText);
    newButton = document.createElement('button');
    newButton.id = "secret-coordinates";
    newButton.textContent = "location";
    newLocationForm.appendChild(newButton);
    a = document.body.appendChild(newLocationForm);
    newLocationForm.addEventListener("submit", function(e){
      e.preventDefault();
      if (newText.value === "Yavin 4") {
        document.body.style.backgroundColor = 'green';
      } else {
        document.body.style.backgroundColor = 'red';
      }
    });
  }

  function attachTextListener(input, func) {
    if (window.addEventListener) {
      input.addEventListener('keydown', func, false);
    } else
    input.attachEvent('onpropertychange', function() {
      func.call(input);
    });
  }
  dStar.addEventListener("mouseover", nameAppear);
  aRaan.addEventListener("mouseover", nameAppear);
  dStar.addEventListener("mouseout", nameDisappear);
  aRaan.addEventListener("mouseout", nameDisappear);
  neverTell.addEventListener("mousedown", function(e){
    aRaan.style.width = "230px";
    aRaan.style.height = "230px";
    aRaan.style.backgroundColor="red"});
  neverTell.addEventListener("mouseup", function(e){
    aRaan.style.opacity = "0.5";
    setInterval(aRaanRemove,3000); });
  tell.addEventListener("click", addNewLocationForm);

//   if (document.body.style.backgroundColor == 'green'){}
//     var bodyTextListener = document.getElementsByTagName('body')[0];
//   console.log(bodyTextListener)
//   attachTextListener(bodyTextListener, function() {
//     debugger; });
// }
}
