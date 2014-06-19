$(document).ready(function(){
  $('#java').click(javaJive);
  $('#calc').click(checkIncreasing);
});

function javaJive(e) {
  $('h1').text('Jabba Jive');
  $('body').addClass('pink');
  $(this).attr("disabled", "disabled");
}

function checkIncreasing(e) {
  var increasing = true;
  var numbers = $('#calc_input').val().split(',')
  for (i = 0; i < numbers.length; i++) {
    // convert the string to number
    numbers[i] = parseInt(numbers[i]);
    // skip the first one because of i - 1
    if (i > 0) {
      if (numbers[i] < numbers[i - 1]) {
        increasing = false;
      }
    }
  }
  if (increasing) {
    $('body').removeClass('red');
    $('body').addClass('green');
  } else {
    $('body').removeClass('green');
    $('body').addClass('red');
  }
};
