$(document).on('turbolinks:load', function(){
  function buildHTML(comment){
    var html = `
                <div class ="username">
                ${comment.user_name}
                <div class="comment-style">
                  ${comment.text}`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var href = window.location.href + '/comments'
    $.ajax({
      url: href,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').prepend(html);
      $('.message-field__area').val('')
    })
//↓エラー時の処理
    .fail(function(){
      alert("error");
    })
  })
})