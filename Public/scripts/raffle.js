window.odometerOptions = {
  duration: 10000 // Change how long the javascript expects the CSS animation to take
}

window.onload = function () {
  new Audio('/drumroll.wav').play()
  var winningNumberContainter0 = document.getElementById('winning-nummber-info-0')
  var winningNumber0 = winningNumberContainter0.getAttribute('data-winning-number')
  document.getElementById('odometer-0').innerHTML = '0' + winningNumber0

  var winningNumberContainter1 = document.getElementById('winning-nummber-info-1')
  var winningNumber1 = winningNumberContainter1.getAttribute('data-winning-number')
  document.getElementById('odometer-1').innerHTML = '0' + winningNumber1

  var winningNumberContainter2 = document.getElementById('winning-nummber-info-2')
  var winningNumber2 = winningNumberContainter2.getAttribute('data-winning-number')
  document.getElementById('odometer-2').innerHTML = '0' + winningNumber2

  var winningNumberContainter3 = document.getElementById('winning-nummber-info-3')
  var winningNumber3 = winningNumberContainter3.getAttribute('data-winning-number')
  document.getElementById('odometer-3').innerHTML = '0' + winningNumber3

  var winningNumberContainter4 = document.getElementById('winning-nummber-info-4')
  var winningNumber4 = winningNumberContainter4.getAttribute('data-winning-number')
  document.getElementById('odometer-4').innerHTML = '0' + winningNumber4
}
