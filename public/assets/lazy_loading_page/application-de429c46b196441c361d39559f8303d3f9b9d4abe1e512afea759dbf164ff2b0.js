("turbolinks:load DOMContentLoaded ready".split(" ")).forEach(function(e){
  document.addEventListener(e, function() {
    lazyLoad();
  })
});

function lazyLoad(){
  var $lazy_loaders = document.querySelectorAll(".lazy_load:not([data-later='true'])");
  for (var i = 0; i < $lazy_loaders.length; i++) {
    (function(i){
      $lazy_loader = $lazy_loaders[i];
      loadElement($lazy_loader);
      // xhttp.setRequestHeader("Content-type", "application/js");
      // $.ajax({
      //  $lazy_loader.getAttribute("data-id")
      //  url = $lazy_loader.getAttribute("data-url")
      // });
    })(i);
  };
}

function loadElement(ele){
  if ((window.jQuery !== undefined || window.$ !== undefined) && ele instanceof jQuery)
    ele = ele[0];
  var id = ele.getAttribute("data-id");
  var url = ele.getAttribute("data-url");
  if (ele.getAttribute("data-loader")
    != "false")
    addLoader(ele);
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function(){ajaxCallback(xhttp, id);};
  xhttp.open("GET", url, true);
  xhttp.send();
}

function addLoader(ele){
  // var loader_img = $("<div class='"+id+"' style='height: 40px; width: 100%;'><div class='uil-ellipsis-css'><div class='ib'><div class='circle'><div></div></div><div class='circle'><div></div></div><div class='circle'><div></div></div><div class='circle'><div></div></div><div class='clear'></div></div></div></div>")
  // var loader_img = $('<div class="loading-container" data-id="'+id+'"><span class="loading-indicator"><i></i><i></i><i></i></span></div>');
  // $($lazy_loader).parent().append(loader_img);
  var loader_img = document.createElement("div");
  loader_img.setAttribute("class", "loading-container")
  loader_img.setAttribute("data-id", ele.getAttribute("data-id"));
  var span = document.createElement("span");
  span.setAttribute("class", "loading-indicator")
  for(var j=0; j<3; j++){
    var i = document.createElement("i");
    span.appendChild(i);
  }
  loader_img.appendChild(span)
  ele.parentElement.replaceChild(loader_img, ele);
  loader_img.appendChild(ele);
  // var loader_img = $('<div class="loading-container" data-id="'+ele.getAttribute("data-id")+'"><span class="loading-indicator"><i></i><i></i><i></i></span></div>');
  // $(ele).replaceWith(loader_img);
  // loader_img.append($(ele));
}

function ajaxCallback(xhttp, id) {
  var elementToReplace = document.querySelectorAll("[data-id='"+id+"']")[0];
  if (xhttp.readyState == 4 && xhttp.status == 200) {
    if (window.$ !== undefined){
      new_ele = $(xhttp.responseText);
      $(elementToReplace).replaceWith(new_ele);
      $("."+ id).remove();
    }
    else{
      var parentElement = elementToReplace.parentNode;
      var template = document.createElement("template");
      template.innerHTML = xhttp.responseText;
      var newElement = template.content.firstElementChild;
      parentElement.replaceChild(newElement, elementToReplace);
      // var parser = new DOMParser();
      // var doc = parser.parseFromString(xhttp.responseText, "text/html");
      // var newElements = doc.querySelector("body");
      // parentElement.replaceChild(newElements, elementToReplace);
      // while (oldParent.childNodes.length > 0) {
      //   newParent.appendChild(oldParent.childNodes[0]);
      // }
      // if (newElements.firstElementChild !== null){
      //   var parentElement =  elementToReplace.parentNode;
      //   var newElement = newElements.firstElementChild;
      //   parentElement.replaceChild( newElement, elementToReplace);
      //   while(newElement.nextElementSibling !== null){
      //     newElement = newElement.nextElementSibling;
      //     parentElement.appendChild(newElement);
      //   }
      // }
    }
  }
}
;
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

;
