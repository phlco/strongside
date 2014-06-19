$(document).ready(function(){
  displayRandom();

  setUpVoteButtons();
})

function displayRandom () {
  $.ajax({
      type: 'GET',
      url: '/random.json',
      }).done(function(data) {
        console.log(data);
        displayCat(data);
      })
}

function displayCat (data) {
  var catImage = $('<img></img>');
  catImage.attr('data-id', data.id)
  catImage.attr('data-score', data.score)
  catImage.attr('src', data.img_url)
  catImage.attr('height', '300px')
  $('body').append(catImage);
}

function setUpVoteButtons () {
  $('#up').on('click', function() {
    debugger;
    $('img');
    voteVote('up');
  });

  $('#down').on('click', function() {
  
  });
}

function voteVote (updataCatParams) {
  $.ajax({
    type: 'PUT',
    url: '/random.json',
    data: updataCatParams
  }).done(function(data) {
    console.log(data);
    displayCat(data);
  })
}
