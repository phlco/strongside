var timesToAdd = 100;

document.onreadystatechange = function(){
  for (var i = 0; i<timesToAdd; i++){
    var $tiles = document.createElement('div');
    $tiles.className = "tiles"
    $('body').append($tiles)
  }

  $('.tiles').each(function(){
    $('.tiles').on("mouseover",function(e){
      $(this).addClass('green')
    })
  })

  $('.tiles').each(function(){
    $('.tiles').on("mouseout",function(e){
      $(this).removeClass('green')
    })
  })
}