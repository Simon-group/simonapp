$(document).on('turbolinks:load', function() {
  $fileField = $('#upload-image')

  $($fileField).on('change', $fileField, function(e) {

      file = e.target.files[0]
      reader = new FileReader(),
      $preview = $(".movie-group-form__field--right--mask");

      reader.onload = (function(file) {
        return function(e) {
          $preview.empty();
          $preview.append($('<img>').attr({
            src: e.target.result,
            width: "50%",
            height: "200px",
            class: "preview-image",
            title: file.name
          }));
        };
      })(file);
      reader.readAsDataURL(file);
    });
  });

  $(function() {
  
    $(".remove_btn").on("click", function() {
      $(".hidden").empty();
    });
  });