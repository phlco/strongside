    var context;

    // SC.initialize({
    //   client_id:'9907b9176ff3ca255b472d3d22a880bb'
    // });

    try {
    if(typeof webkitAudioContext === 'function') { // webkit-based
      context = new webkitAudioContext();
    }
    else { // other browsers that support AudioContext
      context = new AudioContext();
    }
  }
  catch(e) {
    alert("Web Audio API is not supported in this browser");
  }


  var container, stats;
  var camera, scene, projector, raycaster, renderer;

  var mouse = new THREE.Vector2(), INTERSECTED;
  var radius = 100, theta = 0;
  var source, sourceJs;
  var analyser;
  var buffer;
  // var url = 'meltdown.mp3';
  var array = [];
  var timeArray = [];
  var bubble;
  var cubes = [];
  var spheres = [];
  var newTimer = new Date();


  var url = 'https://api.soundcloud.com/tracks/118852333/stream?client_id=9907b9176ff3ca255b472d3d22a880bb';
  var request = new XMLHttpRequest();
  request.open("GET", url, true);
  request.responseType = "arraybuffer";
  request.send();

  request.onload = function() {
    context.decodeAudioData(
      request.response,
      function(buffer) {
        if(!buffer) {
                // Error decoding file data
                alert("error decoding buffer");
                return;
              }

              sourceJs = context.createJavaScriptNode(2048);
              sourceJs.buffer = buffer;
              sourceJs.connect(context.destination);
              analyser = context.createAnalyser();
              analyser.smoothingTimeConstant = 0.6;
              analyser.fftSize = 512;

              source = context.createBufferSource();
              source.buffer = buffer;

              source.connect(analyser);
              analyser.connect(sourceJs);
              source.connect(context.destination);

              sourceJs.onaudioprocess = function(e) {
                array = new Uint8Array(analyser.frequencyBinCount);
                analyser.getByteFrequencyData(array);
              };

              source.noteOn(0);
            },
            function(error) {
            // Decoding error
          }
          );
  };





  init();
  animate();

  function init() {

    container = document.createElement( 'div' );
    container.id = 'container';
    document.body.appendChild( container );
    camera = new THREE.PerspectiveCamera( 70, window.innerWidth / window.innerHeight, 1, 10000 );

    scene = new THREE.Scene();

    var light = new THREE.DirectionalLight( 0xffffff, 2 );
    light.position.set( 1, 1, 1 ).normalize();
    scene.add( light );

    var light = new THREE.DirectionalLight( 0xffffff );
    light.position.set( -1, -1, -1 ).normalize();
    scene.add( light );

    var geometry = new THREE.CubeGeometry(10, 30, 30);

    for ( var i = 0; i < 2000; i ++ ) {

      var object = new THREE.Mesh( geometry, new THREE.MeshLambertMaterial( { color: Math.random() * 0xffffff } ) );

      object.position.x = Math.random() * 800 - 400;
      object.position.y = Math.random() * 800 - 400;
      object.position.z = Math.random() * 800 - 400;

      object.rotation.x = Math.random() * 2 * Math.PI;
      object.rotation.y = Math.random() * 2 * Math.PI;
      object.rotation.z = Math.random() * 2 * Math.PI;

      object.scale.x = Math.random() + 0.5;
      object.scale.y = Math.random() + 0.5;
      object.scale.z = Math.random() + 0.5;

      scene.add( object );
      cubes.push( object );

    }

    projector = new THREE.Projector();
    raycaster = new THREE.Raycaster();

    renderer = new THREE.WebGLRenderer();
    renderer.sortObjects = true;
    renderer.setSize( window.innerWidth, window.innerHeight );

    container.appendChild(renderer.domElement);

    stats = new Stats();
    stats.domElement.style.position = 'absolute';
    stats.domElement.style.top = '0px';
    container.appendChild( stats.domElement );



    document.addEventListener( 'mousemove', onDocumentMouseMove, false );

        //

        window.addEventListener( 'resize', onWindowResize, false );

        window.addEventListener( 'click', onClick);

      }

      function onWindowResize() {

        camera.aspect = window.innerWidth / window.innerHeight;
        camera.updateProjectionMatrix();

        renderer.setSize( window.innerWidth, window.innerHeight );

      }

      function onDocumentMouseMove( event ) {

        event.preventDefault();

        mouse.x = ( event.clientX / window.innerWidth ) * 2 - 1;
        mouse.y = - ( event.clientY / window.innerHeight ) * 2 + 1;

      }

      function onClick( event ) {
        event.preventDefault();
        mouse.xClick = event.x - 400;
        mouse.yClick = event.y - 100;

        var sphereGeometry = new THREE.SphereGeometry(10);
        var sphere = new THREE.Mesh( sphereGeometry, new THREE.MeshLambertMaterial( { color: Math.random() * 0xffffff } ) );
        sphere.position.x = mouse.xClick;
        sphere.position.y = mouse.yClick;
        spheres.push( sphere );
        scene.add( sphere );
        stats.update();
      }

      //

      function animate() {

        requestAnimationFrame( animate );

        render();
        stats.update();

      }



      function render() {


        var k = 0;
        var elapsed = 0;
        for(var i = 0; i < cubes.length; i++) {
          var scale = ( array[k] + 50 ) / 30;
          // console.log(array[k]);
          cubes[i].scale.x = ( scale < 1? 1: scale );
          if(array[k] > 190 && checkTime()){
            renderer.setClearColor( 0xffffff, 1 );
            console.log("hi");
          }
          else if(checkTime()){
            renderer.setClearColor( 0x000000, 1 );
          }
          else if(array[k] < 110 && checkTime()) {
            renderer.setClearColor( 0x0000ff, 0.8 );
          }
          k += ( k < array.length? 1 : 0 );
        }
        var timer = setInterval(sphereColors, 50);
        function sphereColors() {
          if(spheres.length > 0){
            var sphere = spheres[Math.floor(Math.random()*spheres.length)];
            sphere.position.y -= 0.4;
          }
        }


        theta += 0.1;

        camera.position.x = radius * Math.sin( THREE.Math.degToRad( theta ) );
        camera.position.y = radius * Math.sin( THREE.Math.degToRad( theta ) );
        camera.position.z = radius * Math.cos( THREE.Math.degToRad( theta ) );
        camera.lookAt( scene.position );


        // find intersections

        var vector = new THREE.Vector3( mouse.x, mouse.y, 1 );
        projector.unprojectVector( vector, camera );

        raycaster.set( camera.position, vector.sub( camera.position ).normalize() );

        var intersects = raycaster.intersectObjects( scene.children );

        if ( intersects.length > 0 ) {

          if ( INTERSECTED != intersects[ 0 ].object ) {

            if ( INTERSECTED ) INTERSECTED.material.emissive.setHex( INTERSECTED.currentHex );
            // console.log(intersects);
            INTERSECTED = intersects[ 0 ].object;
            INTERSECTED.currentHex = INTERSECTED.material.emissive.getHex();
            INTERSECTED.material.emissive.setHex( 0xff0000 );

          }

        } else {

          if ( INTERSECTED ) INTERSECTED.material.emissive.setHex( INTERSECTED.currentHex );

          INTERSECTED = null;

        }

        renderer.render( scene, camera );

      }



  function checkTime() {
    var timeNow = new Date();
    if((timeNow - newTimer) > 1){
      newTimer = new Date();
      return true;
    }
    else {
      return false;
    }
  }