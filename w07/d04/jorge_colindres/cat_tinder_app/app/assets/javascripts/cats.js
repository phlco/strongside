// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$.ajax('cats.json', {
  type: 'get',
  success: function(response){
    console.log(response);
  }
});

var newCat = {
  cat: {
    name: 'Timmy',
    age: '2',
    tag_line: 'Pretzels',
    img_url: 'http://placekitten.com/200/600'
  }
};

function buildCat(){
  $.ajax('cats.json', {
    type: 'post',
    data: newCat,
    success: function(response){
      console.log(response);
    }
  });
}

function destroyCat(){
  var url = 'cats/' + cat.id;
  $.ajax(url, {
    type: 'delete',
    success: function(response){
      console.log('success');
    }
  });
}
