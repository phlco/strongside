// 1_click_to_pink_inline_css
// Use JQuery so that when you click on "Click Me", it will make the page have a pink background. Use JQuery's .css method to do this first which changes it's inline style
// $("#button").click(function() {
//   $("#page").css("background-color", "pink");
// });

//2_click_to_pink_via_setting_class
//Instead of changing inline styles, it is much better to add and remove class names to change functionality. Use jQuery's .addClass and .on function to do this.
// $("#button").click(function() {
//   $("#page").addClass("changeBackgroundPink");
// });

//3_click_to_pink_click_to_unpink
//Now when you click on it again, make it so that the background is no longer pink
// $("#button").click(function(){
//   var $page = $("#page");
//   if ($page[0].className === "changeBackgroundPink") {
//     $("#page").removeClass("changeBackgroundPink");
//   } else {
//     $("#page").addClass("changeBackgroundPink");
//   }
// });

//4_click_to_change_through_colors
//Now when you click it, it doesn't just change to pink, it changes through a slew of colors. Consider holding your colors in an array. Look into HSL color picking.
//colors = ["#E87BA6", "#FFF44E", "#85F2FF", "#F93B40", "#B100FF"];
$("#button").click(function(){
  var $page = $("#page");
  debugger;
  if ($page[0].className === "changeBackgroundPink") {
    $("#page").removeClass("changeBackgroundPink");
    $("#page").addClass("changeBackground1");
  } else if ($page[0].className === "changeBackground1") {
    $("#page").removeClass("changeBackground1");
    $("#page").addClass("changeBackground2");
  } else if ($page[0].className === "changeBackground2") {
    $("#page").removeClass("changeBackground2");
    $("#page").addClass("changeBackground3");
  } else if ($page[0].className === "changeBackground3"){
    $("#page").removeClass("changeBackground3");
    $("#page").addClass("changeBackground4");
  } else if ($page[0].className === "changeBackground4"){
    $("#page").removeClass("changeBackground4");
    $("#page").addClass("changeBackground5");
  } else if ($page[0].className === "changeBackground5"){
    $("#page").removeClass("changeBackground5");
    $("#page").addClass("changeBackgroundPink");
  } else {
    $("#page").addClass("changeBackgroundPink");
  }
});



