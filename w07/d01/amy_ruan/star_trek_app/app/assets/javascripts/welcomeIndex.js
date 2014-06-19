var enterprise = document.getElementById('enterprise')

var countTotalCrew = function(){
  var xhr = new XMLHttpRequest();
  xhr.open("get","/crew_members",true);
  xhr.onreadystatechange = function(){
    console.log(this.readyState);
    if(this.readyState === 4){
      var crew = JSON.parse(xhr.response);
      var crewResult = crew.length;
      var info = document.getElementById('info');
      info.textContent = crewResult + " members"
    }
  }
  xhr.send(null)
}

var countRefugees = function(){
  var xhr = new XMLHttpRequest();
  xhr.open("get","/refugees",true);
  xhr.onreadystatechange = function(){
    console.log(this.readyState);
    if(this.readyState === 4){
      var refugees = JSON.parse(xhr.response);
      var refugeesResult = refugees.length;
      var info2 = document.getElementById('info2');
      info2.textContent = refugeesResult + " refugees"
    }
  }
  xhr.send(null)
}

var showCaptainLog = function(){
  var form = new FormData;

}
  enterprise.addEventListener("mouseover",countTotalCrew)
  enterprise.addEventListener("mouseover",countRefugees)
  enterprise.addEventListener("dblclick",showCaptainLog)

var findCrew = function(){
  var xhr = new XMLHttpRequest();
  xhr.open("get","/crew_members",false);
  xhr.send(null)
  var response = JSON.parse(xhr.response);
  return response
}



var vulcan = document.getElementById('vulcan');

var showMembers = function(){
  var vulcan = document.getElementById('vulcan');
  var vulcanPClass = document.getElementById('vulcan').children;
  for (var i = 0; i < vulcanPClass.length; i++){
    var crew = findCrew();
    var member = crew[i]
    vulcanPClass[i].textContent = member.name
    vulcanPClass[i].style.backgroundColor = member.shirt_color
  }
}

var addVulcan = function(){
  var vulcan = document.getElementById('vulcan');
  var vulcanPClass = document.getElementById('vulcan').children;
  for (var i = 0; i < vulcanPClass.length; i++){
    var form = new FormData();
    form.append("refugee[name]",vulcanPClass[i].id);
    xhr = new XMLHttpRequest();
    xhr.open("POST","/refugees",false)
    xhr.send(form)
    xhr.response
  }
}

vulcan.addEventListener("click",showMembers)
vulcan.addEventListener("click",addVulcan)


var space = document.getElementById('space');
var space1 = document.createElement('article');
space1.className = "bird-of-prey"
space1.style.visibility = "hidden"
var DOM_img = document.createElement("img");
DOM_img.src = "assets/birdofprey.jpeg";
space1.appendChild(DOM_img);


var space2 = document.createElement('article');
space2.className = "starship"
var DOM_img2 = document.createElement("img");
DOM_img2.src = "assets/starship.jpeg";
var health = document.createElement('div')
health.id = "health"
health.textContent = "0"
health.style.visibility="visible"
space2.appendChild(DOM_img2);
space2.appendChild(health)
space.appendChild(space1)
space.appendChild(space2)

var healthAdd = function(){

}

var healthMinus = function(){

}
// DOM_img2.addEventListener("click",function)
// DOM_img2.addEventListener("dblclick",func2)



window.setInterval(function(){
    if(space1.style.visibility == 'hidden'){
        space1.style.visibility = 'visible';
    }else{
        space1.style.visibility = 'hidden';
    }
}, 60000);

function findSequence(goal){
  function find(start,history){
    if (start==goal)
      {return history;
    else if (start > goal)
      {return null}
    else
      {return find(start + 5, "("+ history + " + 5")||
            find(start * 3, "(" + history + " * 3")}
    return find(1,"1");
  }
}
