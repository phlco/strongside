function sortNumbers(e){
  var numbers = $('input[name=numbers]').val();
  numbers = numbers
      .split(',')
      .map(function(e, i) { return parseInt(e) })
      .sort(function(a, b) {return a > b })
      .join(', ');
  $('#quiz').remove();
  $('#output').text(numbers);
}

function randomNumbers(e){
  var number = $('input[name=numbers]').val();
  $.ajax({
    url: '/random',
    type: 'post',
    dataType: 'json',
    data: {number: number}
  }).done(function(data){
    $('input[name=numbers]').val(data.join(', '));
  });
}
