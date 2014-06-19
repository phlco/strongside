function sayGoodMorning() {
  console.log("Good Morning!");
}

function callMethod(yield) {
  yield();
}

callMethod(function() {
  sayGoodMorning();
});
