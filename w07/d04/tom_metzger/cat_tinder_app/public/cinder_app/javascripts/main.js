var newCatParams = {
  cat: {
    name: "spanky",
    age: "3"
  }
}


// $.ajax({
//   type: "GET",
//   url: "cats.json",
//   data: newCatParams
// }).done(function)


$.ajax({
  type: "POST",
  url: "cats.json",
  data: newCatParams
}).done(function(data){
  alert("you created a new cat");
});

