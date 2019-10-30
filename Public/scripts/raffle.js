window.odometerOptions = {
  duration: 10000, // Change how long the javascript expects the CSS animation to take
  };

  window.onload = function(){
    new Audio('/drumroll.wav').play()
    var winningNumberContainter = document.getElementById("winning-nummber-info");
    var winningNumber = winningNumberContainter.getAttribute("data-winning-number");
    document.getElementById("odometer").innerHTML="0" + winningNumber;
  };
