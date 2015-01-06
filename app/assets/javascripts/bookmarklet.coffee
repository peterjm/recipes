# javascript:(function(){var script=document.createElement('script');script.setAttribute('src','http://localhost:3000/assets/add.js');document.body.appendChild(script);})();

(->
  window.location = "http://localhost:3000/recipes/new?source=#{encodeURIComponent(window.location)}"
)()
