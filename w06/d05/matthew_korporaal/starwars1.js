
<script>
var s1 = {name: "Bail Organa", allegiance: "Rebel Alliance"};
var s2 = {name: "Mon Mothma", allegiance: "Rebel Alliance"};
var s3 = {name: "Admiral Ackbar", allegiance: "Rebel Alliance"};

var rebelAlliance = [s1, s2, s3];

var say = function(SWCharacter){
  debugger
  if (this.s3 === s3) {
    return "It's a trap"
  } else {
    return "May the force be with you"
  }
}
say(s3);

</script>