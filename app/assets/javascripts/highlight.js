(function(){

var textColor = "#000000";
var selectedColor = "#d0b03c";
var focusColor = "#ffe377";
var selectStart = null;
var ignoreClicks = false;

var style = document.createElement("style");

// WebKit hack :(
style.appendChild(document.createTextNode(""));

document.head.appendChild(style);

style.sheet.insertRule(".select-focus { background-color: "+focusColor+"; color: "+textColor+"}", 0);
style.sheet.insertRule(".select-selected { background-color: "+selectedColor+"; color: "+textColor+"}", 1);


var onTarget = function(fnc, stopPropagation){
  return function(evt){
    if (stopPropagation) {
      evt.stopPropagation();
    }
    fnc(evt.target);
  };
};

var select = function(element){
  if (ignoreClicks) { return; };

  if (element.classList.contains('select-focus')) {
    element.classList.toggle('select-selected');
    var selectedChildren = element.querySelectorAll(".select-selected");
    for (var i = 0; i < selectedChildren.length; i++) {
      selectedChildren[i].classList.remove('select-selected');
    }
  }
};

var hover = function(element){
  element.classList.add("select-hover");
};

var unhover = function(element){
  element.classList.remove("select-hover");
};

var focus = function(element){
  var highlightedChildren = element.querySelectorAll(".select-focus");
  if (highlightedChildren.length == 0) {
    var parent = element.closest('.select-focus');

    while (parent) {
      parent.classList.remove("select-focus");
      parent = element.closest('.select-focus');
    }

    element.classList.add("select-focus");
  }
};

var blur = function(element){
  element.classList.remove("select-focus");
  var parent = element.closest('.select-hover');
  if (parent) {
    parent.classList.add("select-focus");
  }
};

var dragSelect = function(element){
  if (!selectStart) { return; }

  var selectedChildren = element.querySelectorAll(".select-selected");
  if (selectedChildren.length == 0) {
    element.classList.add('select-selected');
  }
};

document.addEventListener("mousedown", function(){
  selectStart = new Date().getTime();
});
document.addEventListener("mouseup", function(){
  duration = new Date().getTime() - selectStart;
  selectStart = null;

  if (duration > 200) {
    ignoreClicks = true;
    setTimeout(function(){
      ignoreClicks = false;
    }, 10);
  }
});

var elements = document.querySelectorAll("p, pre, div, ul, ali");
for (var i = 0; i < elements.length; i++) {
  elements[i].addEventListener("mouseenter", onTarget(hover), true);
  elements[i].addEventListener("mouseleave", onTarget(unhover), true);

  elements[i].addEventListener("mouseenter", onTarget(focus), true);
  elements[i].addEventListener("mouseleave", onTarget(blur), true);

  elements[i].addEventListener("mouseenter", onTarget(dragSelect), true);
  elements[i].addEventListener("mouseleave", onTarget(dragSelect), true);

  elements[i].addEventListener("click", onTarget(select, true));
}

})();
