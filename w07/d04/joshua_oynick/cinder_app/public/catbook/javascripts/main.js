$.ajax({
    type: "GET",
    url: "http://localhost:3000/cats.json"
  }).done(function(response) {
    console.log(response);
    jQuery.each(response, function(i, cat) {
      console.log(cat.name)
      $( "body" ).append( "<p>" + cat.name + "</p>" );
    });
});

$("form").on("submit", function(e) {
  e.preventDefault();
  console.log("hello");
  var cat_info = {
    name: $("input[name=name]").val(),
    tag_line: $("input[name=tag_line]").val(),
    age: $("input[name=age]").val(),
    image_url: $("input[name=image_url]").val()
  }

  $.ajax({
    type: "POST",
    url: "http://localhost:3000/cats",
    data: {cat: cat_info},
    dataType: "JSON"
  }).done(function(cat){
    console.log(cat);
    $( "body" ).append( "<p>" + cat.name + "</p>" );
  })

})

// when someone types in info and clicks submit, we need to: stop the form submitting, we need to get the values from the text inputs, then we need to do an ajax request to post that data


// $("input[name=name]")
