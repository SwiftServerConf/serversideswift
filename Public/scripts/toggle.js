var sm = document.getElementById("star-sm");
var lg = document.getElementById("star-lg");

document.getElementsByClassName('checkbox-label')[0].onclick = function() {

  if (sm.classList.contains("star-sm")) {
    sm.classList.remove("star-sm");
  } else {
    sm.classList.add("star-sm");
  }

  if (lg.classList.contains("star-lg")) {
    lg.classList.remove("star-lg");
  } else {
    lg.classList.add("star-lg");
  }
};