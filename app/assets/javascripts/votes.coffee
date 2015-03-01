$(document).on("ready page:load", ->
    $("#upvote").on("ajax:success", (e, data, status, xhr) ->
      $("#vote-count").html xhr.responseText
      $("#downvote").css("color", "#111")
      $("#upvote").css("color", "#dd4814")
    ).on "ajax:error", (e, xhr, status, error) ->
      console.log "ERROR"

    $("#downvote").on("ajax:success", (e, data, status, xhr) ->
      $("#vote-count").html xhr.responseText
      $("#upvote").css("color", "#111")
      $("#downvote").css("color", "#dd4814")
    ).on "ajax:error", (e, xhr, status, error) ->
      console.log "ERROR")

$(document).ready ->
  $("#tags").textext
    plugins: 'autocomplete tags ajax'
    ajax:
      url: '/tags.json'
      dataType: 'json'
      cacheResults: true
