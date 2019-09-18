$(document).on('turbolinks:load', function(){  
  document.addEventListener(
    "DOMContentLoaded", e => {
      let modal_open = document.getElementById("btn btn-default btn-block");
      modal_open.onclick = function () {
        $('#overlay').fadeIn();
        document.getElementById('modal-close-btn').onclick = function () {
          $('#overlay').fadeOut();
        };
        document.getElementById("delete-comformation-btn").onclick = function () {
          document.getElementById("item-delete-btn").click();
        };
      };
    },
    false
  );
});