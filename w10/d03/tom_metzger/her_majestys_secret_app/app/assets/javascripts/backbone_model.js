var Film = Backbone.Model.extend ({

  this.gross = function() {
    // the issue with the gross data is that the string can't be directly converted
    // This trims off the $ from the gross value
    var withCommas = this.get("gross").slice(1);
    // splits the string to remove the commas
    var number_array = withCommas.split(",");
    // rejoins the numbers to create a string of just numbers, since the numebrs are a string the + acts as a concatenate
    // var number_string = _.reduce(number_array,function(memo, next){return memo + next})
    // better option for the line above is .join("")
    var number_string = number_array.join("");
    return parseInt(number_string);
  }

})
