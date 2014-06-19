// 1. When you visit this page: list out all the cats in the entirety of catbook
// 2. Add a form to this page so that you can create new cats
// 3. WHen you click on a delete button next to a cat, then delete the cat from your screen, and your database.


$(document).ready(function(){
  callCats();
  eventListeners();
});

//THESE ARE OUR FUNCTIONS

function callCats() {
  $.ajax({
    type: "GET",
    url: '/cats.json'
    }).done(displayCats);
};

function displayCats(data) {
  var allCatsDiv = $("<div>")
  $.each(data, function(i, cat) {
    var thisCatUl = $("<ul>");
    var nameLi = $("<li>");
    var ageLi = $("<li>");
    var taglineLi = $("<li>");
    nameLi.text(cat.name);
    ageLi.text(cat.age);
    taglineLi.text(cat.tagline);
    thisCatUl.append(nameLi, ageLi, taglineLi);
    allCatsDiv.append(thisCatUl);
  })
  $('body').append(allCatsDiv);
};

function eventListeners(){
  $("#submit").on("click", createCat);
};

function createCat(){
  var newCatName = $("#name").val();
  var newCatAge = $("#age").val();
  var newCatTagline = $("#tagline").val();
  var newCatImage = $("#image").val();
  newCat = {cat: {name: newCatName, age: newCatAge, tagline: newCatTagline, image: newCatImage} };
  postCats(newCat);
}

function postCats(newCat) {
  $.ajax({
    type: "POST",
    data: newCat,
    url: '/cats'
  }).done(addNewCat(newCat));
};

function addNewCat(newCat) {
  debugger;
}


