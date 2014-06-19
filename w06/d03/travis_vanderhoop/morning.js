var lyric = "We should have each other to tea";

var wordCount = function(string){
  wordArray = string.split(' ');
  count = wordArray.length;
  return count;
  console.log(count)
}

var lyric = "o bla di o bla da";

var wordFrequency = function(string){
    var frequencyObject= {}
    var wordArray = string.split(' ');
    for(var i=0; i<wordArray.length; i++) {
      var word = wordArray[i]
      if (frequencyObject[word]) {
        frequencyObject[word]+=1;
      }
      else {
        frequencyObject[word] = 1;
      }

    }
    return frequencyObject;
};


// var longestWord = function(string) {
//     var longest = "";
//     var wordArray = string.split(' ');
//     for(var i=0; i<wordArray.length; i++) {
//       var word = wordArray[i];
//       if (word.length > longest.length) {
//         longest = word;
//       };

//     };
//     return longest;
// };

var lyric = "heaven knows I'm miserable now";
var longestWords = function(string) {
    var longestWordsArray = [];
    var wordArray = string.split(' ');
    longestWordsArray.push(wordArray[0]);
    for(var i=0; i < wordArray.length; i++) {
      var word = wordArray[i];
      if (word.length > longestWordsArray[0].length) {
        longestWordsArray = [word];
      };
      else if (word.length == longestWordsArray[0]) {
        longestWordsArray.push(word);
      };

    };
    return longestWordsArray;
};

var shortestWord = function(string) {
    var shortest = "dfa;lkdjfa;dkfja;dskfjads;fkjads;fkajsdf";
    var wordArray = string.split(' ');
    for(var i=0; i<wordArray.length; i++) {
      var word = wordArray[i];
      if (word.length < shortest.length) {
        shortest = word;
      };

    };
    return shortest;
};

// var shortestWord = function(string) {
//     var shortest = "dfa;lkdjfa;dkfja;dskfjads;fkjads;fkajsdf";
//     var wordArray = string.split(' ');
//     for(var i=0; i<wordArray.length; i++) {
//       var word = wordArray[i];
//       if (word.length < shortest.length) {
//         shortest = word;
//       };

//     };
//     return shortest;
// };

