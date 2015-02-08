// javascript:(function(){var script=document.createElement('script');script.setAttribute('id', 'RecipesBookmarklet');script.setAttribute('src','http://HOSTNAME/bookmarklet.js');document.body.appendChild(script);})();

(function(){
  var recipe = encodeURIComponent(window.location);
  var parser = document.createElement('a');
  parser.href = document.getElementById('RecipesBookmarklet').getAttribute('src');
  window.location = parser.protocol + '//' + parser.host + "/recipes/new?source=" + recipe;
})();
